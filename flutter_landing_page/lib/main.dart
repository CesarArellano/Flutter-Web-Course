import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_landing_page/router/router.dart';

void main() {
  Flurorouter.configureRoutes(); 
  runApp( const MyApp() );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scrollBehavior: AppScrollBehavior(),
      debugShowCheckedModeBanner: false,
      title: 'Home Page',
      onGenerateRoute: Flurorouter.router.generator,
    );
  }
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
    PointerDeviceKind.touch,
    PointerDeviceKind.mouse,
  };
}