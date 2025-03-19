// To parse this JSON data, do
//
//     final configsMaster = configsMasterFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
part 'configs_master_model.g.dart';

ConfigsMaster configsMasterFromJson(String str) =>
    ConfigsMaster.fromJson(json.decode(str));

String configsMasterToJson(ConfigsMaster data) => json.encode(data.toJson());

@JsonSerializable()
class ConfigsMaster {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "value_1")
  String? value1;
  @JsonKey(name: "value_2")
  String? value2;
  @JsonKey(name: "ios_version")
  String? iosVersion;
  @JsonKey(name: "android_version")
  String? androidVersion;
  @JsonKey(name: "current_version")
  String? currentVersion;
  @JsonKey(name: "min_version")
  String? minVersion;

  ConfigsMaster({
    this.id,
    this.name,
    this.value1,
    this.value2,
    this.iosVersion,
    this.androidVersion,
    this.currentVersion,
    this.minVersion,
  });

  factory ConfigsMaster.fromJson(Map<String, dynamic> json) =>
      _$ConfigsMasterFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigsMasterToJson(this);
}
