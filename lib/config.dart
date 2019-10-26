import 'dart:ui';

import 'package:flutter/material.dart';

/// FlutterCN 配置常量
class Config {
  Config._();

  static const appUser = "Plucky";
  static const appEmail = "plucky@echo.engineer";

  // image
  static const imageUrl = "assets/images";
  static const logoUrl = "$imageUrl/logo@white.png";
  static const avatarUrl = "$imageUrl/user.jpg";
  static const splashBg = "$imageUrl/splash.jpg";
  static const splashUrl =
      "http://img.1991th.com/tuchongeter/statics/F3UN3AHCF24T34V";
  static const avatarNetUrl =
      "http://img.1991th.com/tuchongeter/statics/user-03.jpg";

  // theme
  static const rootTheme = TextStyle(
      color: Colors.white,
      fontFamily: "Quicksand",
      letterSpacing: 2,
      wordSpacing: 2);

  // color
  static List<Color> kitGradients = [
    new Color.fromRGBO(103, 218, 255, 1.0),
    new Color.fromRGBO(3, 169, 244, 1.0),
    new Color.fromRGBO(0, 122, 193, 1.0),
    Colors.blueGrey.shade800,
    Colors.black87,
  ];
}
