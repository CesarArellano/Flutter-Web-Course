
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../providers/page_provider.dart';
import '../ui/pages/home_page.dart';

final homeHandler = Handler(
  handlerFunc: ( context, params ) {
    final page = params['page']!.first;
    final pageProvider = Provider.of<PageProvider>(context!, listen: false);
    if( page != '/') {
      pageProvider.createScrollController(page);
      return const HomePage();
    }
    
    return const SizedBox();
  }
);