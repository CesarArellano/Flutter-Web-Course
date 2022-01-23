import 'package:flutter/material.dart';
import 'package:web_bases/locator.dart';

import 'package:web_bases/router/route_generator.dart';
import 'package:web_bases/services/navigation_service.dart';
import 'package:web_bases/ui/layout/main_layout_page.dart';

void main() {
  setupLocator();
  runApp( const MyApp() );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Routes App',
      initialRoute: '/stateful',
      onGenerateRoute: RouteGenerator.generateRoute,
      navigatorKey: navigationService.navigationKey,
      builder: ( _, child) {
        return MainLayoutPage(
          child: child ?? const CircularProgressIndicator() 
        );
      },
    );
  }
}