// To parse this JSON data, do
//
//     final uploadAwsRes = uploadAwsResFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

part 'upload_aws_model.g.dart';

UploadAws uploadAwsFromJson(String str) => UploadAws.fromJson(json.decode(str));

String uploadAwsToJson(UploadAws data) => json.encode(data.toJson());

@JsonSerializable()
class UploadAws {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "path")
  String? path;
  @JsonKey(name: "date")
  DateTime? date;
  @JsonKey(name: "size")
  String? size;
  @JsonKey(name: "type")
  String? type;

  UploadAws({
    this.name,
    this.path,
    this.date,
    this.size,
    this.type,
  });

  factory UploadAws.fromJson(Map<String, dynamic> json) =>
      _$UploadAwsFromJson(json);

  Map<String, dynamic> toJson() => _$UploadAwsToJson(this);
}
