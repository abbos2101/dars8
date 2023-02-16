import 'package:flutter/foundation.dart';

class CountProvider extends ChangeNotifier {
  var _count = 0;

  void increment() {
    _count++;
    notifyListeners();
  }

  void decrement() {
    _count--;
    notifyListeners();
  }

  int get count => _count;
}
