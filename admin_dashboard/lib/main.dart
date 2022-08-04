import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'api/cafe_api.dart';
import 'providers/providers.dart';
import 'router/router.dart';
import 'services/services.dart';
import 'theme/app_theme.dart';
import 'ui/layouts/layouts.dart';


void main() async {
  await LocalStorage.configurePrefs();
  CafeApi.configureDio();
  Flurorouter.configureRoutes();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider(), lazy: false),
        ChangeNotifierProvider(create: (_) => SideMenuProvider(), lazy: false),
        ChangeNotifierProvider(create: (_) => UsersProvider(), lazy: false),
        ChangeNotifierProvider(create: (_) => CategoriesProvider()),
        ChangeNotifierProvider(create: (_) => UserFormProvider()),
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
      scaffoldMessengerKey: NotificationService.messengerKey,
      builder: ( _, child) {
        child ??= const SizedBox();
        log('Token: ${ LocalStorage.prefs.getString('token') }');
        final authProvider = Provider.of<AuthProvider>(context);
        
        if( authProvider.authStatus == AuthStatus.checking ) {
          return const SplashLayout();
        }

        if( authProvider.authStatus == AuthStatus.authenticated ) {
          return DashboardLayout(child: child);
        }
        
        return AuthLayout(child: child);
      },
    );
  }
}