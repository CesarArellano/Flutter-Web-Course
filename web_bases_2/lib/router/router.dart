
import 'package:fluro/fluro.dart';

import 'package:web_bases/router/route_handlers.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();
  
  static void configureRoute() {
    router.define(
      '/',
      handler: counterHandler,
      transitionType: TransitionType.fadeIn
    );

    router.define(
      '/stateful',
      handler: counterHandler,
      transitionType: TransitionType.fadeIn
    );

    router.define(
      '/stateful/:base',
      handler: counterHandler,
      transitionType: TransitionType.fadeIn
    );

    router.define(
      '/provider',
      handler: providerCounterHandler,
      transitionType: TransitionType.fadeIn
    );

    router.define(
      '/dashboard/users/:userId/:roleId',
      handler: dashboardUserHandler,
      transitionType: TransitionType.fadeIn
    );


    router.notFoundHandler = pageNotFoundHandler;
  }

}