// Package imports:

// Package imports:
import 'package:go_router/go_router.dart';

// Project imports:
import 'package:Medikalam/services/routing/utils/extensions/screen_name_extension.dart';
import 'package:Medikalam/services/routing/utils/router_list.dart';

///Class For Instantiating Routing
class AppRouter {
  AppRouter();

  ///Router Instance
   final GoRouter router = GoRouter(
    debugLogDiagnostics: true,
    routes: routerList,
    initialLocation: AppScreens.splash.path,
  );
}
