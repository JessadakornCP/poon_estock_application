import 'package:json_annotation/json_annotation.dart';
part 'work_group_model.g.dart';

@JsonSerializable()
class WorkGroup {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'name', defaultValue: '')
  String? name;

  WorkGroup({
    this.id,
    this.name,
  });

  factory WorkGroup.fromJson(Map<String, dynamic> json) =>
      _$WorkGroupFromJson(json);

  Map<String, dynamic> toJson() => _$WorkGroupToJson(this);
}
