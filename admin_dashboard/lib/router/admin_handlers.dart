import 'package:fluro/fluro.dart';

import '../ui/layouts/auth/auth_layout.dart';

class AdminHandlers {
  static Handler login = Handler(
    handlerFunc:(context, parameters) {
      return const AuthLayout();
    },
  );
}