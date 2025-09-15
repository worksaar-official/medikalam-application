// Flutter imports:

// Flutter imports:
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Package imports:
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:toastification/toastification.dart';

// Project imports:
import 'package:Medikalam/services/routing/app_router.dart';
import 'package:Medikalam/src/core/injection/injection.dart';
import 'package:Medikalam/src/core/theme/theme.dart';
import 'package:Medikalam/src/core/utils/environment/environment.dart';
import 'package:Medikalam/src/core/utils/helpers/permission_helper.dart';
import 'package:Medikalam/src/core/utils/helpers/logger.dart';
import 'package:Medikalam/src/providers/provider.dart';
import 'package:Medikalam/src/providers/pen/pen_provider.dart';

import 'src/core/utils/helpers/console_log_capture.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: Environment.fileName);

  if (kReleaseMode) {
    await SentryFlutter.init((options) {
      options.dsn =
          'https://d0aabf241a7286ef4d8b8be6c4128dea@o4509366751068161.ingest.us.sentry.io/4509366752837632';
      options.tracesSampleRate = 1.0;
      options.environment = 'production';
    }, appRunner: () => _initializeApp());
  } else {
    _initializeApp();
  }
}

Future<void> _initializeApp() async {
  await localInjection();
  configureDependencies();

  // Initialize console log capture
  // await ConsoleLogCapture().initialize();

  // Reset pen connection state before creating app but preserve MAC address
  await getIt<PenProvider>().resetConnectionState(preserveMacAddress: true);

  injectRouter();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      PermissionHandler.requestAllPermissions(context);
      // Reset pen connection state after build completes but preserve MAC address
      Future.delayed(Duration.zero, () {
        context
            .read<PenProvider>()
            .resetConnectionState(preserveMacAddress: true);
      });
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    logger.i('APP_LIFECYCLE: App state changed to: $state');

    if (state == AppLifecycleState.resumed) {
      // App came to foreground, trigger auto-reconnection setup if needed
      Future.delayed(const Duration(milliseconds: 500), () {
        try {
          final penProvider = context.read<PenProvider>();
          if (penProvider.shouldAutoReconnect) {
            logger.i(
                'APP_LIFECYCLE: App resumed, pen should auto-reconnect when cap is opened');
            // The auto-reconnection will happen automatically when pen cap is opened
            // thanks to the BLE scanning that should already be active
          }
        } catch (e) {
          logger.e('APP_LIFECYCLE: Error during app resume pen check: $e');
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, deviceType) {
        return MultiProvider(
          providers: List.from(providers),
          child: ToastificationWrapper(
            child: MaterialApp.router(
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [Locale('en', 'US')],
              theme: ApplicationTheme.lightTheme,
              debugShowCheckedModeBanner: false,
              routerConfig: getIt<AppRouter>().router,
              builder: EasyLoading.init(),
            ),
          ),
        );
      },
    );
  }
}
