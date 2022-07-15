import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/auth_provider.dart';
import 'router/router.dart';
import 'services/local_storage.dart';
import 'services/navigation_service.dart';
import 'theme/app_theme.dart';
import 'ui/layouts/auth/auth_layout.dart';
import 'ui/layouts/dashboard/dashboard_layout.dart';
import 'ui/layouts/splash/splash_layout.dart';

void main() async {
  await LocalStorage.configurePrefs();
  Flurorouter.configureRoutes();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider(), lazy: false)
      ],
      child: const MyApp(),
    );
  }
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard',
      theme: AppTheme.lightTheme,
      initialRoute: Flurorouter.rootRoute,
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      builder: ( _, child) {
        print('Token: ${ LocalStorage.prefs.getString('token') }');
        final authProvider = Provider.of<AuthProvider>(context);
        if( authProvider.authStatus == AuthStatus.checking ) {
          return const SplashLayout();
        }
        if( authProvider.authStatus == AuthStatus.authenticated ) {
          return DashboardLayout(child: child ?? const SizedBox());
        }
        return AuthLayout(child: child ?? const SizedBox());
      },
    );
  }
}