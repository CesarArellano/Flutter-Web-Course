import 'package:admin_dashboard/router/admin_handlers.dart';
import 'package:admin_dashboard/router/no_page_found_handlers.dart';
import 'package:fluro/fluro.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';
  // Auth Routes
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  // Dashboard Routes
  static String dashboardRoute = '/dashboard';

  // Auth Router
  static void configureRoutes() {
    router.define(rootRoute, handler: AdminHandlers.login);
    router.define(loginRoute, handler: AdminHandlers.login);
    // TODO: Define dashboard route.
    // router.define(dashboardRoute, handler: handler);

    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}