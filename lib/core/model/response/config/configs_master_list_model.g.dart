// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configs_master_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigsMasterList _$ConfigsMasterListFromJson(Map<String, dynamic> json) =>
    ConfigsMasterList(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => ConfigsMaster.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ConfigsMasterListToJson(ConfigsMasterList instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
