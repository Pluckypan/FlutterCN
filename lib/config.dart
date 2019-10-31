import 'dart:ui';

import 'package:easylib/helper.dart';
import 'package:flutter/material.dart';

/// FlutterCN 配置常量
class Config {
  Config._();

  static const appUser = "Plucky";
  static const appEmail = "plucky@echo.engineer";

  /// 免费接口不是很稳定,可使用本地Mock形式调用
  /// Mock 的文件在根目录 `mock` 文件夹下
  /// 需要根据自己 ip 修改

  static const forceHost = true;
  static const host = "https://www.apiopen.top/";
  static const mockHost = "http://172.18.16.224:1997/";

  // image
  static const imageUrl = "assets/images";
  static const logoUrl = "$imageUrl/logo@white.png";
  static const avatarUrl = "$imageUrl/user.jpg";
  static const imgCoinAssets = "$imageUrl/coin.png";
  static const imgBubbleAssets = "$imageUrl/bubble.png";
  static const imgTriangleAssets = "$imageUrl/triangle.png";
  static const splashBg = "$imageUrl/splash.jpg";
  static const splashUrl =
      "http://img.1991th.com/tuchongeter/statics/F3UN3AHCF24T34V";
  static const avatarNetUrl =
      "http://img.1991th.com/tuchongeter/statics/user-03.jpg";

  static const imgNetGallery1 =
      "http://img.1991th.com/tuchongeter/statics/single-gallery-01.jpg";
  static const imgNetGallery2 =
      "http://img.1991th.com/tuchongeter/statics/single-gallery-02.jpg";
  static const imgNetGallery3 =
      "http://img.1991th.com/tuchongeter/statics/single-gallery-03.jpg";

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

  static String getHost() {
    return (Helper.releaseMode || forceHost) ? host : mockHost;
  }
}
