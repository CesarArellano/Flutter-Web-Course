import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {

  CounterProvider( String base ) {
    _counter = int.tryParse(base) ?? 0;
  }
  
  int _counter = 10;
  
  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }

}