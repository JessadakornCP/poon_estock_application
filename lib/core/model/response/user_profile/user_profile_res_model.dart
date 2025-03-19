import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'user_profile_model.dart';
part 'user_profile_res_model.g.dart';

UserProfileRes userProfileResFromJson(String str) =>
    UserProfileRes.fromJson(json.decode(str));
String userProfileResToJson(UserProfileRes data) => json.encode(data.toJson());

@JsonSerializable()
class UserProfileRes {
  @JsonKey(name: 'response_status')
  String? responseStatus;

  @JsonKey(name: 'message', defaultValue: '')
  String? message;

  @JsonKey(name: 'data')
  UserProfile? data;

  UserProfileRes({
    this.responseStatus,
    this.message,
    this.data,
  });

  factory UserProfileRes.fromJson(Map<String, dynamic> json) =>
      _$UserProfileResFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileResToJson(this);
}
