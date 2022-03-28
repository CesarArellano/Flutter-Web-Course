
import 'package:fluro/fluro.dart';
import 'package:web_bases/ui/views/counter_provider_view.dart';
import 'package:web_bases/ui/views/counter_view.dart';
import 'package:web_bases/ui/views/error_view.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();
  
  static void configureRoute() {
    router.define(
      '/',
      handler: _counterHandler,
      transitionType: TransitionType.fadeIn
    );

    router.define(
      '/stateful',
      handler: _counterHandler,
      transitionType: TransitionType.fadeIn
    );

    router.define(
      '/stateful/:base',
      handler: _counterHandler,
      transitionType: TransitionType.fadeIn
    );

    router.define(
      '/provider',
      handler: _providerCounterHandler,
      transitionType: TransitionType.fadeIn
    );

    router.notFoundHandler = _pageNotFoundHandler;
  }

  // Handlers
  static final Handler _counterHandler = Handler(
    handlerFunc: ( context, params ) {
      // print(params['base']?[0]);
      return CounterView( base: params['base']![0] );
    }
  );

  static final Handler _providerCounterHandler = Handler(
    handlerFunc: ( _, __) => const CounterProviderView()
  );

  static final Handler _pageNotFoundHandler = Handler(
    handlerFunc: ( _, __) => const ErrorView()
  );
}