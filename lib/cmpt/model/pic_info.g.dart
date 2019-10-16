// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pic_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PicInfo _$PicInfoFromJson(Map<String, dynamic> json) {
  return PicInfo(
    json['url'] as String,
    json['width'] as int,
    json['height'] as int,
    json['ref'] as String,
  );
}

Map<String, dynamic> _$PicInfoToJson(PicInfo instance) => <String, dynamic>{
      'url': instance.url,
      'width': instance.width,
      'height': instance.height,
      'ref': instance.ref,
    };
