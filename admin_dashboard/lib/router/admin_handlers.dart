import 'package:fluro/fluro.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';
import '../ui/views/dashboard_view.dart';
import '../ui/views/login_view.dart';
import '../ui/views/register_view.dart';

class AdminHandlers {
  static Handler login = Handler(
    handlerFunc:(context, parameters) {
      final authProvider = Provider.of<AuthProvider>(context!);
      if( authProvider.authStatus == AuthStatus.notAuthenticated ) {
        return const LoginView();
      } else {
        return const DashboardView();
      }
    },
  );

  static Handler register = Handler(
    handlerFunc:(context, parameters) {
      return const RegisterView();
    },
  );
}