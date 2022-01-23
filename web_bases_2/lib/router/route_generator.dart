import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:web_bases/ui/pages/counter_page.dart';
import 'package:web_bases/ui/pages/counter_provider_page.dart';

import 'package:web_bases/ui/pages/error_page.dart';

class RouteGenerator {

  static Route<dynamic> generateRoute( RouteSettings settings ) {
    switch (settings.name) {
      case '/stateful':
        return _fadeRoute( const CounterPage(), '/stateful' );
      case '/provider':
        return _fadeRoute( const CounterProviderPage(), '/provider' );
      default:
        return _fadeRoute( const ErrorPage(), '/404' );
    }
  }

  static PageRoute _fadeRoute( Widget child, String routeName ) {
    return PageRouteBuilder(
      settings: RouteSettings( name: routeName ),
      pageBuilder: ( _, __, ___ ) => child,
      transitionDuration: const Duration( milliseconds: 200 ),
      transitionsBuilder: ( _, animation, __, ___) => 
        kIsWeb 
        ? FadeTransition(
          opacity: animation,
          child: child,
        )
        : CupertinoPageTransition(
          primaryRouteAnimation: animation,
          secondaryRouteAnimation: __,
          child: child,
          linearTransition: true
        )
    );
  }
}