
import 'package:fluttercn/cmpt/api/base_api.dart';
import 'package:fluttercn/cmpt/model/city_weather.dart';

class WeatherApi extends BaseApi {
  Future<CityWeather> getWeather(String city) async {
    var resp = await dio.get("weatherApi", queryParameters: {"city": city});
    return CityWeather.fromJson(convert(resp));
  }
}
