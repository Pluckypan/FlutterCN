// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

News _$NewsFromJson(Map<String, dynamic> json) {
  return News()
    ..tcount = json['tcount'] as int
    ..picInfo = (json['picInfo'] as List)
        ?.map((e) =>
            e == null ? null : PicInfo.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..docid = json['docid'] as String
    ..channel = json['channel'] as String
    ..link = json['link'] as String
    ..source = json['source'] as String
    ..title = json['title'] as String
    ..digest = json['digest'] as String
    ..category = json['category'] as String
    ..ptime = json['ptime'] as String
    ..type = json['type'] as String;
}

Map<String, dynamic> _$NewsToJson(News instance) => <String, dynamic>{
      'tcount': instance.tcount,
      'picInfo': instance.picInfo,
      'docid': instance.docid,
      'channel': instance.channel,
      'link': instance.link,
      'source': instance.source,
      'title': instance.title,
      'digest': instance.digest,
      'category': instance.category,
      'ptime': instance.ptime,
      'type': instance.type,
    };
