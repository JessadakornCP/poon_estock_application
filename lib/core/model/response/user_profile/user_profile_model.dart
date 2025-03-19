import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';
import '../work_group/work_group_model.dart';
import 'user_profile_infomation/user_profile_infomation_model.dart';
part 'user_profile_model.g.dart';

UserProfile userProfileFromJson(String str) =>
    UserProfile.fromJson(jsonDecode(str));
String userProfileToJson(UserProfile data) => jsonEncode(data.toJson());

@JsonSerializable()
class UserProfile {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'username', defaultValue: '')
  String? username;

  @JsonKey(name: 'full_name', defaultValue: '')
  String? fullName;

  @JsonKey(name: 'position', defaultValue: '')
  String? position;

  @JsonKey(name: 'profileImg')
  String? profileImg;

  @JsonKey(name: 'point', defaultValue: 0)
  double? point;

  @JsonKey(name: 'businessLeave', defaultValue: 0)
  double? businessLeave;

  @JsonKey(name: 'sickLeave', defaultValue: 0)
  double? sickLeave;

  @JsonKey(name: 'holidayLeave', defaultValue: 0)
  double? holidayLeave;

  @JsonKey(name: 'otherLeave', defaultValue: 0)
  double? otherLeave;

  @JsonKey(name: 'leaveWithOutPay', defaultValue: 0)
  double? leaveWithOutPay;

  @JsonKey(name: 'sumLate', defaultValue: 0)
  double? sumLate;

  @JsonKey(name: 'status', defaultValue: '')
  String? status;

  @JsonKey(name: 'workGroupId')
  int? workGroupId;

  @JsonKey(name: 'work_group')
  WorkGroup? workGroup;

  @JsonKey(name: 'workStartDate')
  DateTime? workStartDate;

  @JsonKey(name: 'workEndDate')
  DateTime? workEndDate;

  @JsonKey(name: 'sumOT', defaultValue: 0)
  double? sumOT;

  @JsonKey(name: 'isCheckProfileInformation', defaultValue: false)
  bool? isCheckProfileInformation;

  @JsonKey(name: 'isVerify', defaultValue: false)
  bool? isVerify;

  @JsonKey(name: 'isCompleteProfile', defaultValue: false)
  bool? isCompleteProfile;

  @JsonKey(name: 'isEditProfile', defaultValue: false)
  bool? isEditProfile;

  @JsonKey(name: 'isFirstLogin', defaultValue: false)
  bool? isFirstLogin;

  @JsonKey(name: 'firebaseToken')
  String? firebaseToken;

  @JsonKey(name: 'platform')
  String? platform;

  @JsonKey(name: 'token')
  String? token;

  @JsonKey(name: 'isChangePassword', defaultValue: false)
  bool? isChangePassword;

  @JsonKey(name: 'isManager', defaultValue: false)
  bool? isManager;

  @JsonKey(name: 'isOwner', defaultValue: false)
  bool? isOwner;

  @JsonKey(name: 'activeFlag', defaultValue: false)
  bool? activeFlag;

  @JsonKey(name: 'userProfileInformation')
  UserProfileInformation? userProfileInformation;

  UserProfile({
    this.id,
    this.username,
    this.fullName,
    this.position,
    this.profileImg,
    this.point,
    this.businessLeave,
    this.sickLeave,
    this.holidayLeave,
    this.otherLeave,
    this.leaveWithOutPay,
    this.sumLate,
    this.status,
    this.workGroupId,
    this.workGroup,
    this.workStartDate,
    this.workEndDate,
    this.sumOT,
    this.isCheckProfileInformation,
    this.isVerify,
    this.isCompleteProfile,
    this.isEditProfile,
    this.isFirstLogin,
    this.firebaseToken,
    this.platform,
    this.token,
    this.isChangePassword,
    this.isManager,
    this.isOwner,
    this.activeFlag,
    this.userProfileInformation,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}
