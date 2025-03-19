import 'package:json_annotation/json_annotation.dart';
part 'prefix_name_th_model.g.dart';

@JsonSerializable()
class PrefixNameTH {
  @JsonKey(name: 'id')
  int? id;

  @JsonKey(name: 'name', defaultValue: '')
  String? name;

  PrefixNameTH({
    this.id,
    this.name,
  });

  factory PrefixNameTH.fromJson(Map<String, dynamic> json) =>
      _$PrefixNameTHFromJson(json);

  Map<String, dynamic> toJson() => _$PrefixNameTHToJson(this);
}
