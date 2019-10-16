import 'package:fluttercn/cmpt/model/base_model.dart';
import 'package:fluttercn/cmpt/model/news.dart';
import 'package:json_annotation/json_annotation.dart';

part 'news_list.g.dart';

@JsonSerializable()
class NewsList extends BaseModel {
  List<News> tech;
  List<News> auto;
  List<News> money;
  List<News> sports;
  List<News> dy;
  List<News> war;
  List<News> ent;
  List<News> toutiao;
  List<News> home;

  NewsList();

  factory NewsList.fromJson(Map<String, dynamic> json) =>
      _$NewsListFromJson(json);

  Map<String, dynamic> toJson() => _$NewsListToJson(this);
}
