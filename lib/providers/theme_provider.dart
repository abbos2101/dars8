import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  var _mode = ThemeMode.light;

  void change() {
    _mode = _mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  ThemeMode get mode => _mode;
}
