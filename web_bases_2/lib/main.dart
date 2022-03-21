import 'package:flutter/material.dart';
import 'package:web_bases/locator.dart';

import 'package:web_bases/router/router.dart';
import 'package:web_bases/services/navigation_service.dart';
import 'package:web_bases/ui/layout/main_layout_page.dart';

void main() {
  setupLocator();
  Flurorouter.configureRoute();
  runApp( const MyApp() );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Routes App',
      initialRoute: '/',
      onGenerateRoute: Flurorouter.router.generator,
      // onGenerateRoute: RouteGenerator.generateRoute,
      navigatorKey: locator<NavigationService>().navigationKey,
      builder: ( _, child) {
        return MainLayoutPage(
          child: child ?? const CircularProgressIndicator() 
        );
      },
    );
  }
}