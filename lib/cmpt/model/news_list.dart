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
    List<News> news;
    switch (key) {
      case "home":
        news = home;
        break;
      case "toutiao":
        news = toutiao;
        break;
      case "ent":
        news = ent;
        break;
      case "tech":
        news = tech;
        break;
      case "auto":
        news = auto;
        break;
      case "money":
        news = money;
        break;
      case "sports":
        news = sports;
        break;
      case "dy":
        news = dy;
        break;
      case "war":
        news = war;
        break;
      default:
        news = home;
        break;
    }
    return news.where((item) =>
        (item.title?.isNotEmpty ?? false) && (item.ptime?.isNotEmpty ?? false)).toList();
  }
}
