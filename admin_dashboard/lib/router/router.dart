import 'package:fluro/fluro.dart';

import 'admin_handlers.dart';
import 'dashboard_handlers.dart';
import 'no_page_found_handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  static String rootRoute = '/';
  // Auth Routes
  static String loginRoute = '/auth/login';
  static String registerRoute = '/auth/register';

  // Dashboard Routes
  static String dashboardRoute = '/dashboard';
  static String iconsRoute = '/dashboard/icons';
  static String blankRoute = '/dashboard/blank';
  static String categoriesRoute = '/dashboard/categoriesRoute';
  static String usersRoute = '/dashboard/users';
  static String userRoute = '/dashboard/users/:uid';

  // Auth Router
  static void configureRoutes() {
    // Admin
    router.define(rootRoute, handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(loginRoute, handler: AdminHandlers.login, transitionType: TransitionType.none);
    router.define(registerRoute, handler: AdminHandlers.register, transitionType: TransitionType.none);

    // Dashboard
    router.define(dashboardRoute, handler: DashboardHandlers.dashboard, transitionType: TransitionType.fadeIn);
    router.define(iconsRoute, handler: DashboardHandlers.icons, transitionType: TransitionType.fadeIn);
    router.define(blankRoute, handler: DashboardHandlers.blank, transitionType: TransitionType.fadeIn);
    router.define(categoriesRoute, handler: DashboardHandlers.categories, transitionType: TransitionType.fadeIn);
    
    // Users
    router.define(usersRoute, handler: DashboardHandlers.users, transitionType: TransitionType.fadeIn);
    router.define(userRoute, handler: DashboardHandlers.user, transitionType: TransitionType.fadeIn);

    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}