import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttercn/generated/i18n.dart';

enum AppTheme { Blue, Pink }

class ThemeProvider extends ChangeNotifier {
  AppTheme _theme = AppTheme.Blue;

  changeTheme(AppTheme theme) {
    _theme = theme;
    notifyListeners();
  }

  change(bool blue) {
    changeTheme(blue ? AppTheme.Blue : AppTheme.Pink);
  }

  ThemeData getTheme() {
    return themes[_theme.index];
  }

  bool isBlue() {
    return _theme == AppTheme.Blue;
  }

  String themeName(BuildContext context) {
    return isBlue() ? S.of(context).theme_blue : S.of(context).theme_pink;
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
