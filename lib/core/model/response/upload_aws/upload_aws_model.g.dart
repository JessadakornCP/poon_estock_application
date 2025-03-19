// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_aws_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UploadAws _$UploadAwsFromJson(Map<String, dynamic> json) => UploadAws(
      name: json['name'] as String?,
      path: json['path'] as String?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      size: json['size'] as String?,
      type: json['type'] as String?,
    );

Map<String, dynamic> _$UploadAwsToJson(UploadAws instance) => <String, dynamic>{
      'name': instance.name,
      'path': instance.path,
      'date': instance.date?.toIso8601String(),
      'size': instance.size,
      'type': instance.type,
    };
