import 'dart:io';

import 'package:fluttercn/cmpt/api/base_api.dart';
import 'package:fluttercn/cmpt/model/city_weather.dart';
import 'package:fluttercn/cmpt/model/resp.dart';

class WeatherApi extends BaseApi {
  Future<CityWeather> getWeather(String city) async {
    var resp = await dio.get("weatherApi", queryParameters: {"city": city});
    if (resp.statusCode == HttpStatus.ok) {
      var apiResp = Resp.fromJson(resp.data);
      return CityWeather.fromJson(apiResp.data);
    } else {
      throw Exception(resp.statusMessage);
    }
  }
}
