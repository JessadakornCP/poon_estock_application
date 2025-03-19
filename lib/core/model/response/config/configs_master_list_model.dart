import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'configs_master_model.dart';
part 'configs_master_list_model.g.dart';

ConfigsMasterList configsMasterListFromJson(String str) =>
    ConfigsMasterList.fromJson(json.decode(str));

String configsMasterListToJson(ConfigsMasterList data) =>
    json.encode(data.toJson());

@JsonSerializable()
class ConfigsMasterList {
  @JsonKey(name: 'data', defaultValue: [])
  List<ConfigsMaster>? data;

  ConfigsMasterList({
    this.data,
  });

  factory ConfigsMasterList.fromJson(Map<String, dynamic> json) =>
      _$ConfigsMasterListFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigsMasterListToJson(this);
}
