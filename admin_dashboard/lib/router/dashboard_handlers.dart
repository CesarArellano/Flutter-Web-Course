import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/ui/views/blank_view.dart';
import 'package:admin_dashboard/ui/views/icons_view.dart';
import 'package:admin_dashboard/ui/views/login_view.dart';
import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../providers/side_menu_provider.dart';
import '../ui/views/dashboard_view.dart';

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
}