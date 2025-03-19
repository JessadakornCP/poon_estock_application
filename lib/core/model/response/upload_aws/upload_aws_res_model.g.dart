// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_aws_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadAwsRes _$UploadAwsResFromJson(Map<String, dynamic> json) => UploadAwsRes(
      responseStatus: json['response_status'] as String?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : UploadAws.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UploadAwsResToJson(UploadAwsRes instance) =>
    <String, dynamic>{
      'response_status': instance.responseStatus,
      'message': instance.message,
      'data': instance.data,
    };
