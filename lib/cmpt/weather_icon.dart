import 'dart:math';

import 'package:flutter/widgets.dart';

class WeatherIcon {
  WeatherIcon._();

  static const IconData rainy = IconData(0xe614, fontFamily: 'WeatherIcon');
  static const IconData smog = IconData(0xe630, fontFamily: 'WeatherIcon');
  static const IconData sunny = IconData(0xe618, fontFamily: 'WeatherIcon');
  static const IconData snow = IconData(0xe611, fontFamily: 'WeatherIcon');
  static const IconData overcast = IconData(0xe638, fontFamily: 'WeatherIcon');
  static const IconData cloudy = IconData(0xe600, fontFamily: 'WeatherIcon');
  static const IconData frost = IconData(0xe67e, fontFamily: 'WeatherIcon');
  static const IconData thunder = IconData(0xe6f4, fontFamily: 'WeatherIcon');
  static const IconData foggy = IconData(0xe601, fontFamily: 'WeatherIcon');
  static const IconData moon = IconData(0xe63e, fontFamily: 'WeatherIcon');
  static const IconData star = IconData(0xe6cc, fontFamily: 'WeatherIcon');

  ///
  /// 由于接口无明确字段,需要
  /// 根据中文语义解析天气....
  static IconData parseWeather(String weather) {
    if (weather.contains("雨")) {
      return rainy;
    } else if (weather.contains("雾霾") || weather.contains("霾")) {
      return smog;
    } else if (weather.contains("晴")) {
      var now = DateTime.now();
      print(now.hour);
      if (now.hour < 18) {
        return sunny;
      } else {
        return star;
      }
    } else if (weather.contains("雪")) {
      return snow;
    } else if (weather.contains("阴")) {
      return overcast;
    } else if (weather.contains("云")) {
      return cloudy;
    } else if (weather.contains("霜")) {
      return frost;
    } else if (weather.contains("雷")) {
      return thunder;
    } else if (weather.contains("雾")) {
      return foggy;
    } else {
      return sunny;
    }
  }
}
