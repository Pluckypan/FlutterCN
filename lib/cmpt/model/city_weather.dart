import 'package:fluttercn/cmpt/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

import 'weather.dart';

part 'city_weather.g.dart';

@JsonSerializable()
class CityWeather extends BaseModel {
  // 当前城市：成都
  String city;

  // 当前温度：23
  String wendu;

  // 穿衣指数：天凉，昼夜温差较大，较易发生感冒，请适当增减衣服，体质较弱的朋友请注意适当防护。
  String ganmao;

  // 昨日天气：
  Weather yesterday;

  // 天气预报：包含今天天气
  List<Weather> forecast;

  CityWeather(
      this.city, this.wendu, this.ganmao, this.yesterday, this.forecast);

  factory CityWeather.fromJson(Map<String, dynamic> json) =>
      _$CityWeatherFromJson(json);

  Map<String, dynamic> toJson() => _$CityWeatherToJson(this);

  Weather today() {
    return forecast.first;
  }
}
