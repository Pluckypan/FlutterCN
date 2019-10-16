import 'package:fluttercn/cmpt/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pic_info.g.dart';

@JsonSerializable()
class PicInfo extends BaseModel {
  String url;
  int width;
  int height;
  String ref;

  PicInfo(this.url, this.width, this.height, this.ref);

  factory PicInfo.fromJson(Map<String, dynamic> json) =>
      _$PicInfoFromJson(json);

  Map<String, dynamic> toJson() => _$PicInfoToJson(this);
}
