// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'device_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DeviceInfo _$DeviceInfoFromJson(Map<String, dynamic> json) {
  return DeviceInfo()
    ..manufacturer = json['manufacturer'] as String
    ..brand = json['brand'] as String
    ..device = json['device'] as String
    ..model = json['model'] as String
    ..sdk_int = json['sdk_int'] as int
    ..product = json['product'] as String;
}

Map<String, dynamic> _$DeviceInfoToJson(DeviceInfo instance) =>
    <String, dynamic>{
      'manufacturer': instance.manufacturer,
      'brand': instance.brand,
      'device': instance.device,
      'model': instance.model,
      'sdk_int': instance.sdk_int,
      'product': instance.product,
    };
