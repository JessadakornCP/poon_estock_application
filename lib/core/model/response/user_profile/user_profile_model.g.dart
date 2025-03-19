// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      id: (json['id'] as num?)?.toInt(),
      username: json['username'] as String? ?? '',
      fullName: json['full_name'] as String? ?? '',
      position: json['position'] as String? ?? '',
      profileImg: json['profileImg'] as String?,
      point: (json['point'] as num?)?.toDouble() ?? 0,
      businessLeave: (json['businessLeave'] as num?)?.toDouble() ?? 0,
      sickLeave: (json['sickLeave'] as num?)?.toDouble() ?? 0,
      holidayLeave: (json['holidayLeave'] as num?)?.toDouble() ?? 0,
      otherLeave: (json['otherLeave'] as num?)?.toDouble() ?? 0,
      leaveWithOutPay: (json['leaveWithOutPay'] as num?)?.toDouble() ?? 0,
      sumLate: (json['sumLate'] as num?)?.toDouble() ?? 0,
      status: json['status'] as String? ?? '',
      workGroupId: (json['workGroupId'] as num?)?.toInt(),
      workGroup: json['work_group'] == null
          ? null
          : WorkGroup.fromJson(json['work_group'] as Map<String, dynamic>),
      workStartDate: json['workStartDate'] == null
          ? null
          : DateTime.parse(json['workStartDate'] as String),
      workEndDate: json['workEndDate'] == null
          ? null
          : DateTime.parse(json['workEndDate'] as String),
      sumOT: (json['sumOT'] as num?)?.toDouble() ?? 0,
      isCheckProfileInformation:
          json['isCheckProfileInformation'] as bool? ?? false,
      isVerify: json['isVerify'] as bool? ?? false,
      isCompleteProfile: json['isCompleteProfile'] as bool? ?? false,
      isEditProfile: json['isEditProfile'] as bool? ?? false,
      isFirstLogin: json['isFirstLogin'] as bool? ?? false,
      firebaseToken: json['firebaseToken'] as String?,
      platform: json['platform'] as String?,
      token: json['token'] as String?,
      isChangePassword: json['isChangePassword'] as bool? ?? false,
      isManager: json['isManager'] as bool? ?? false,
      isOwner: json['isOwner'] as bool? ?? false,
      activeFlag: json['activeFlag'] as bool? ?? false,
      userProfileInformation: json['userProfileInformation'] == null
          ? null
          : UserProfileInformation.fromJson(
              json['userProfileInformation'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'full_name': instance.fullName,
      'position': instance.position,
      'profileImg': instance.profileImg,
      'point': instance.point,
      'businessLeave': instance.businessLeave,
      'sickLeave': instance.sickLeave,
      'holidayLeave': instance.holidayLeave,
      'otherLeave': instance.otherLeave,
      'leaveWithOutPay': instance.leaveWithOutPay,
      'sumLate': instance.sumLate,
      'status': instance.status,
      'workGroupId': instance.workGroupId,
      'work_group': instance.workGroup,
      'workStartDate': instance.workStartDate?.toIso8601String(),
      'workEndDate': instance.workEndDate?.toIso8601String(),
      'sumOT': instance.sumOT,
      'isCheckProfileInformation': instance.isCheckProfileInformation,
      'isVerify': instance.isVerify,
      'isCompleteProfile': instance.isCompleteProfile,
      'isEditProfile': instance.isEditProfile,
      'isFirstLogin': instance.isFirstLogin,
      'firebaseToken': instance.firebaseToken,
      'platform': instance.platform,
      'token': instance.token,
      'isChangePassword': instance.isChangePassword,
      'isManager': instance.isManager,
      'isOwner': instance.isOwner,
      'activeFlag': instance.activeFlag,
      'userProfileInformation': instance.userProfileInformation,
    };
