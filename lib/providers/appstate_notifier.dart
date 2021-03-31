import 'package:flutter/cupertino.dart';

class AppStateNotifier with ChangeNotifier{
  bool isDarkMode = false;

  void updateTheme(bool isDarkMode) {
    this.isDarkMode = isDarkMode;
    notifyListeners();
  }
}