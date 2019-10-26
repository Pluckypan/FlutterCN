import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum AppTheme { Blue, Pink }

class ThemeProvider extends ChangeNotifier {
  AppTheme _theme = AppTheme.Blue;

  changeTheme(AppTheme theme) {
    _theme = theme;
    notifyListeners();
  }

  ThemeData getTheme() {
    return themes[_theme.index];
  }

  static final themes = [
    ThemeData(
      primarySwatch: Colors.blue,
      fontFamily: "Quicksand",
    ),
    ThemeData(
      primarySwatch: Colors.pink,
      fontFamily: "Quicksand",
    )
  ];
}
