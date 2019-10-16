// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Weather _$WeatherFromJson(Map<String, dynamic> json) {
  return Weather()
    ..date = json['date'] as String
    ..high = json['high'] as String
    ..low = json['low'] as String
    ..type = json['type'] as String
    ..fengxiang = json['fengxiang'] as String
    ..fx = json['fx'] as String
    ..fengli = json['fengli'] as String
    ..fl = json['fl'] as String;
}

Map<String, dynamic> _$WeatherToJson(Weather instance) => <String, dynamic>{
      'date': instance.date,
      'high': instance.high,
      'low': instance.low,
      'type': instance.type,
      'fengxiang': instance.fengxiang,
      'fx': instance.fx,
      'fengli': instance.fengli,
      'fl': instance.fl,
    };
