// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Resp _$RespFromJson(Map<String, dynamic> json) {
  return Resp(
    json['code'] as int,
    json['msg'] as String,
    json['data'],
  );
}

Map<String, dynamic> _$RespToJson(Resp instance) => <String, dynamic>{
      'code': instance.code,
      'msg': instance.msg,
      'data': instance.data,
    };
