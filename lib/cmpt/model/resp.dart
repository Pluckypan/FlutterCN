import 'package:fluttercn/cmpt/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'resp.g.dart';

@JsonSerializable()
class Resp extends BaseModel {
  int code;
  String msg;
  Object data;

  Resp(this.code, this.msg, this.data);

  factory Resp.fromJson(Map<String, dynamic> json) => _$RespFromJson(json);

  Map<String, dynamic> toJson() => _$RespToJson(this);
}
