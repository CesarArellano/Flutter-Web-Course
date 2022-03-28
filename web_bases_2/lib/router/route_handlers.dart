import 'package:fluro/fluro.dart' show Handler;

import 'package:web_bases/ui/views/counter_provider_view.dart';
import 'package:web_bases/ui/views/counter_view.dart';
import 'package:web_bases/ui/views/error_view.dart';

final Handler counterHandler = Handler(
  handlerFunc: ( context, params ) {
    return CounterView( base: params['base']?.first ?? '0' );
  }
);

final Handler providerCounterHandler = Handler(
  handlerFunc: ( context, params ) {
    return CounterProviderView( base: params['q']?.first ?? '0' );
  }
);

final Handler pageNotFoundHandler = Handler(
  handlerFunc: ( _, __) => const ErrorView()
);

final Handler dashboardUserHandler = Handler(
  handlerFunc: ( _, params) {
    // print(params);
    return const ErrorView();
  }
);