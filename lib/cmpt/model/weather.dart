import 'package:fluttercn/cmpt/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:easylib/helper.dart';

part 'weather.g.dart';

@JsonSerializable()
class Weather extends BaseModel {
  // 日期：15日星期二
  String date;

  // 高温：高温 18℃
  String high;

  // 低温：低温 14℃
  String low;

  // 天气：阴
  String type;

  // 风向：无持续风向
  String fengxiang;
  String fx;

  // 风力：<![CDATA[<3级]]>
  String fengli;
  String fl;

  Weather();

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherToJson(this);

  int getLowNum() {
    return Helper.parseNum(low);
  }

  int getHighNum() {
    return Helper.parseNum(high);
  }
}
