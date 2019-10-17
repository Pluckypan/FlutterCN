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

  static const Map<String, String> titles = {
    "home": "首页",
    "toutiao": "头条",
    "ent": "娱乐",
    "tech": "科技",
    "auto": "汽车",
    "money": "财经",
    "sports": "体育",
    "dy": "电影",
    "war": "军事",
  };

  List<News> getNews(String key) {
    switch (key) {
      case "home":
        return home;
      case "toutiao":
        return toutiao;
      case "ent":
        return ent;
      case "tech":
        return tech;
      case "auto":
        return auto;
      case "money":
        return money;
      case "sports":
        return sports;
      case "dy":
        return dy;
      case "war":
        return war;
      default:
        return home;
    }
  }
}
