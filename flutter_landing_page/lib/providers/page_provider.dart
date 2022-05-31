// import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class PageProvider extends ChangeNotifier {
  
  PageController scrollController = PageController();
  int _currentIndex = 0;

  final List<String> _pages = ['home', 'about', 'pricing', 'contact', 'location'];

  void createScrollController(String routeName) {
    scrollController = PageController(
      initialPage: getPageIndex(routeName)
    );

    scrollController.addListener(() {
      final pageIndex = (scrollController.page ?? 0).round();
      if( _currentIndex != pageIndex ) {
        html.window.history.pushState(null, 'none', '#/${ _pages[pageIndex] }');
        _currentIndex = pageIndex;
      }
    });
  }
  
  int getPageIndex(String routeName) {
    final index = _pages.indexOf(routeName);
    return (index == -1) ? 0 : index;
  }

  void goTo(int index) {
    scrollController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200), 
      curve: Curves.easeInOut
    );
  }
}