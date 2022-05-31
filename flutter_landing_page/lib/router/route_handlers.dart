
import 'package:fluro/fluro.dart';
import 'package:flutter_landing_page/providers/page_provider.dart';
import 'package:flutter_landing_page/ui/pages/home_page.dart';
import 'package:provider/provider.dart';

final homeHandler = Handler(
  handlerFunc: ( context, params ) {
    final page = params['page']!.first;
    final pageProvider = Provider.of<PageProvider>(context!, listen: false);
    if( page != '/') {
      pageProvider.createScrollController(page);
      return const HomePage();
    }
  }
);