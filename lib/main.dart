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
import 'package:Medikalam/src/providers/provider.dart';
import 'package:Medikalam/src/providers/pen/pen_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: Environment.fileName);

  if (kReleaseMode) {
    await SentryFlutter.init(
      (options) {
        options.dsn =
            'https://d0aabf241a7286ef4d8b8be6c4128dea@o4509366751068161.ingest.us.sentry.io/4509366752837632';
        options.tracesSampleRate = 1.0;
        options.environment = 'production';
      },
      appRunner: () => _initializeApp(),
    );
  } else {
    _initializeApp();
  }
}

Future<void> _initializeApp() async {
  await localInjection();
  configureDependencies();

  // Reset pen connection state before creating app
  await getIt<PenProvider>().resetConnectionState();

  injectRouter();

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Colors.transparent,
    systemNavigationBarIconBrightness: Brightness.dark,
  ));

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      PermissionHandler.requestAllPermissions(context);
      // Reset pen connection state after build completes
      Future.delayed(Duration.zero, () {
        context.read<PenProvider>().resetConnectionState();
      });
    });
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
                GlobalCupertinoLocalizations.delegate
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
