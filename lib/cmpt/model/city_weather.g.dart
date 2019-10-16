// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'city_weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CityWeather _$CityWeatherFromJson(Map<String, dynamic> json) {
  return CityWeather(
    json['city'] as String,
    json['wendu'] as String,
    json['ganmao'] as String,
    json['yesterday'] == null
        ? null
        : Weather.fromJson(json['yesterday'] as Map<String, dynamic>),
    (json['forecast'] as List)
        ?.map((e) =>
            e == null ? null : Weather.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CityWeatherToJson(CityWeather instance) =>
    <String, dynamic>{
      'city': instance.city,
      'wendu': instance.wendu,
      'ganmao': instance.ganmao,
      'yesterday': instance.yesterday,
      'forecast': instance.forecast,
    };
