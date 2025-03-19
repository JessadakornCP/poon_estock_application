// To parse this JSON data, do
//
//     final uploadAwsRes = uploadAwsFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';
import 'upload_aws_model.dart';

part 'upload_aws_list_res_model.g.dart';

UploadAwsListRes uploadAwsListResFromJson(String str) =>
    UploadAwsListRes.fromJson(json.decode(str));

String uploadAwsListResToJson(UploadAwsListRes data) =>
    json.encode(data.toJson());

@JsonSerializable()
class UploadAwsListRes {
  @JsonKey(name: "response_status")
  String? responseStatus;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "data", defaultValue: [])
  List<UploadAws>? data;

  UploadAwsListRes({
    this.responseStatus,
    this.message,
    this.data,
  });

  factory UploadAwsListRes.fromJson(Map<String, dynamic> json) =>
      _$UploadAwsListResFromJson(json);

  Map<String, dynamic> toJson() => _$UploadAwsListResToJson(this);
}
