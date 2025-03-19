// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_aws_list_res_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadAwsListRes _$UploadAwsListResFromJson(Map<String, dynamic> json) =>
    UploadAwsListRes(
      responseStatus: json['response_status'] as String?,
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => UploadAws.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$UploadAwsListResToJson(UploadAwsListRes instance) =>
    <String, dynamic>{
      'response_status': instance.responseStatus,
      'message': instance.message,
      'data': instance.data,
    };
