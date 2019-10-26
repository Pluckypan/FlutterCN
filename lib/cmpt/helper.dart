import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Helper {
  Helper._();

  static Color hexToColor(String s) {
    if (s == null ||
        s.length != 7 ||
        int.tryParse(s.substring(1, 7), radix: 16) == null) {
      s = '#999999';
    }
    return new Color(int.parse(s.substring(1, 7), radix: 16) + 0xFF000000);
  }

  static int parseNum(String str) {
    RegExp reg = new RegExp(r"[0-9]+");
    Iterable<Match> matches = reg.allMatches(str);
    return int.tryParse(matches.first.group(0));
  }

  static showToast(String msg,
      {Toast len = Toast.LENGTH_SHORT,
      ToastGravity gravity = ToastGravity.CENTER,
      Color background = Colors.black,
      Color textColor = Colors.white,
      double fontSize = 16.0}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: len,
        gravity: gravity,
        timeInSecForIos: 1,
        backgroundColor: background,
        textColor: textColor,
        fontSize: fontSize);
  }

  static cancelToast() {
    Fluttertoast.cancel();
  }
}
