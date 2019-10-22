// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..name = json['name'] as String
    ..desc = json['desc'] as String
    ..avatar = json['avatar'] as String
    ..age = json['age'] as int
    ..gender = json['gender'] as int;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'desc': instance.desc,
      'avatar': instance.avatar,
      'age': instance.age,
      'gender': instance.gender,
    };
