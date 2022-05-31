// import 'dart:html' as html;

import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class PageProvider extends ChangeNotifier {
  
  PageController scrollController = PageController();
  final List<String> _pages = ['home', 'about', 'pricing', 'contact', 'location'];

  void goTo(int index) {
    final routeName = _pages[index];
    html.window.history.pushState(null, 'none', '#/$routeName');
    scrollController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200), 
      curve: Curves.easeInOut
    );
  }
}