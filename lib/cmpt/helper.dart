import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Helper {
  Helper._();

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
