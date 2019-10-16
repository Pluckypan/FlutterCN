import 'package:fluttercn/cmpt/model/base_model.dart';
import 'package:fluttercn/cmpt/model/pic_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable()
class News extends BaseModel {
  int tcount;
  List<PicInfo> picInfo;
  String docid;
  String channel;
  String link;
  String source;
  String title;
  String digest;
  String category;
  String ptime;
  String type;

  News();

  factory News.fromJson(Map<String, dynamic> json) => _$NewsFromJson(json);

  Map<String, dynamic> toJson() => _$NewsToJson(this);
}
