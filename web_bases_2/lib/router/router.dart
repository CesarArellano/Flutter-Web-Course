
import 'package:fluro/fluro.dart';
import 'package:web_bases/ui/views/counter_view.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();
  
  static void configureRoute() {
    router.define(
      '/',
      handler: _counterHandler
  ) ;
  }

  // Handlers
  static final Handler _counterHandler = Handler(
    handlerFunc: ( _, __) => const CounterView()
  );
}