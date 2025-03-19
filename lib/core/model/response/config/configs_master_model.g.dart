// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'configs_master_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ConfigsMaster _$ConfigsMasterFromJson(Map<String, dynamic> json) =>
    ConfigsMaster(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      value1: json['value_1'] as String?,
      value2: json['value_2'] as String?,
      iosVersion: json['ios_version'] as String?,
      androidVersion: json['android_version'] as String?,
      currentVersion: json['current_version'] as String?,
      minVersion: json['min_version'] as String?,
    );

Map<String, dynamic> _$ConfigsMasterToJson(ConfigsMaster instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'value_1': instance.value1,
      'value_2': instance.value2,
      'ios_version': instance.iosVersion,
      'android_version': instance.androidVersion,
      'current_version': instance.currentVersion,
      'min_version': instance.minVersion,
    };
