import 'package:fluttercn/cmpt/model/base_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User extends BaseModel {
  User();

  String name;
  String desc;
  String avatar;
  int age;
  int gender;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString() {
    return "[name=$name gender=$gender desc=$desc]";
  }
}
