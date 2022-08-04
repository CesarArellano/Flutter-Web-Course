
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../providers/side_menu_provider.dart';
import '../ui/views/blank_view.dart';
import '../ui/views/categories_view.dart';
import '../ui/views/dashboard_view.dart';
import '../ui/views/icons_view.dart';
import '../ui/views/login_view.dart';
import '../ui/views/user_view.dart';
import '../ui/views/users_view.dart';
import 'router.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(
    handlerFunc:(context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context).setCurrentPageUrl(Flurorouter.dashboardRoute);
      if( authProvider.authStatus == AuthStatus.authenticated ) {
        return const DashboardView();
      } else {
        return const LoginView();
      }
    },
  );

  static Handler icons = Handler(
    handlerFunc:(context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context).setCurrentPageUrl(Flurorouter.iconsRoute);
      if( authProvider.authStatus == AuthStatus.authenticated ) {
        return const IconsView();
      } else {
        return const LoginView();
      }
    },
  );

  static Handler blank = Handler(
    handlerFunc:(context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context).setCurrentPageUrl(Flurorouter.blankRoute);
      if( authProvider.authStatus == AuthStatus.authenticated ) {
        return const BlankView();
      } else {
        return const LoginView();
      }
    },
  );

  static Handler categories = Handler(
    handlerFunc:(context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context).setCurrentPageUrl(Flurorouter.categoriesRoute);
      if( authProvider.authStatus == AuthStatus.authenticated ) {
        return const CategoriesView();
      } else {
        return const LoginView();
      }
    },
  );

  static Handler users = Handler(
    handlerFunc:(context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);
      Provider.of<SideMenuProvider>(context).setCurrentPageUrl(Flurorouter.usersRoute);
      if( authProvider.authStatus == AuthStatus.authenticated ) {
        return const UsersView();
      } else {
        return const LoginView();
      }
    },
  );

  static Handler user = Handler(
    handlerFunc:(context, params) {
      final authProvider = Provider.of<AuthProvider>(context!, listen: false);
      Provider.of<SideMenuProvider>(context).setCurrentPageUrl(Flurorouter.userRoute);
      if( authProvider.authStatus == AuthStatus.authenticated ) {
        if( params['uid']?.first != null) {
          return UserView(uid: params['uid']!.first);
        }
        return const UsersView();
      } else {
        return const LoginView();
      }
    },
  );
}