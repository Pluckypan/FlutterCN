import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:fluttercn/cmpt/helper.dart';
import 'package:fluttercn/cmpt/model/device_info.dart';

class NativeManager {
  NativeManager._();

  static const platform =
      const MethodChannel('echo.engineer.fluttercn/method_channel');
  static const eventChannel =
      const EventChannel("echo.engineer.fluttercn/event_channel");

  static sayHi() async {
    var result = await platform.invokeMethod("sayHi");
    Helper.showToast("$result");
  }

  static showToast(String message) async {
    var result = await platform.invokeMethod("showToast", {"message": message});
    Helper.showToast("$result");
  }

  static Future<DeviceInfo> getDeviceInfo() async {
    var result = await platform.invokeMethod("getDeviceInfo");
    return DeviceInfo.fromJson(json.decode(result));
  }

  static Future<String> openMessageActivity(String message) async {
    return platform.invokeMethod("openMessageActivity", {"message": message});
  }
}
