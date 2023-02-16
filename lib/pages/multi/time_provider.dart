import 'package:flutter/foundation.dart';

class TimeProvider extends ChangeNotifier {
  var _time = 120;

  TimeProvider() {
    start();
  }

  void start() async {
    while (_time != 0) {
      _time--;
      notifyListeners();
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  int get time => _time;
}
