import 'package:fluttercn/cmpt/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'device_info.g.dart';

@JsonSerializable()
class DeviceInfo extends BaseModel {
  DeviceInfo();

  String manufacturer;
  String brand;
  String device;
  String model;
  int sdk_int;
  String product;

  factory DeviceInfo.fromJson(Map<String, dynamic> json) =>
      _$DeviceInfoFromJson(json);

  Map<String, dynamic> toJson() => _$DeviceInfoToJson(this);

  @override
  String toString() {
    return "[manu=$manufacturer brand=$brand sdk=$sdk_int]";
  }
}
