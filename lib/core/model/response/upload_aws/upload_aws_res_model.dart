// To parse this JSON data, do
//
//     final uploadAwsRes = uploadAwsFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import 'upload_aws_model.dart';

part 'upload_aws_res_model.g.dart';

UploadAwsRes uploadAwsResFromJson(String str) =>
    UploadAwsRes.fromJson(json.decode(str));

String uploadAwsResToJson(UploadAwsRes data) => json.encode(data.toJson());

@JsonSerializable()
class UploadAwsRes {
  @JsonKey(name: "response_status")
  String? responseStatus;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data")
  UploadAws? data;

  UploadAwsRes({
    this.responseStatus,
    this.message,
    this.data,
  });

  factory UploadAwsRes.fromJson(Map<String, dynamic> json) =>
      _$UploadAwsResFromJson(json);

  Map<String, dynamic> toJson() => _$UploadAwsResToJson(this);
}
