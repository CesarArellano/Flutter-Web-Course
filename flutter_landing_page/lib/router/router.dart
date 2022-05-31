import 'package:fluro/fluro.dart';

import 'route_handlers.dart';

class Flurorouter {
  
  static final FluroRouter router = FluroRouter();

  static void configureRoutes() {

    router.define('/:page', handler: homeHandler);

    router.notFoundHandler = homeHandler;
  }
}