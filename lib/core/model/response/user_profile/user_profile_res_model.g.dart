// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileRes _$UserProfileResFromJson(Map<String, dynamic> json) =>
    UserProfileRes(
      responseStatus: json['response_status'] as String?,
      message: json['message'] as String? ?? '',
      data: json['data'] == null
          ? null
          : UserProfile.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UserProfileResToJson(UserProfileRes instance) =>
    <String, dynamic>{
      'response_status': instance.responseStatus,
      'message': instance.message,
      'data': instance.data,
    };
