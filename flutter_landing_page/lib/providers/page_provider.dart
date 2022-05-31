import 'package:flutter/material.dart';

class PageProvider extends ChangeNotifier {
  
  PageController scrollController = PageController();

  void goTo(int index) {
    scrollController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200), 
      curve: Curves.easeInOut
    );
  }
}