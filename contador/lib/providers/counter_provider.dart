import 'package:flutter/material.dart';

class CounterProvider with ChangeNotifier {
  int _counter = 15;
  get counter => this._counter;

  void increment() {
    this._counter++;
    notifyListeners();
  }

  void decrement() {
    this._counter--;
    notifyListeners();
  }
}
