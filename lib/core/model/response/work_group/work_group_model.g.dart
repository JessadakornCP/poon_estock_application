// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'work_group_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WorkGroup _$WorkGroupFromJson(Map<String, dynamic> json) => WorkGroup(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$WorkGroupToJson(WorkGroup instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
