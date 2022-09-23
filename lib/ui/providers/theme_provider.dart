import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider();

  bool isLight = true;

  void changeTheme() {
    isLight = !isLight;
    notifyListeners();
  }
}
