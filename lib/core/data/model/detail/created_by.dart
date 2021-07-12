import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'created_by.g.dart';

@JsonSerializable(explicitToJson: true)
class CreatedBy {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "credit_id")
  String? creditId;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "gender")
  int? gender;
  @JsonKey(name: "profile_path")
  String? profilePath;

  CreatedBy({this.id, this.creditId, this.name, this.gender, this.profilePath});

  factory CreatedBy.fromJson(Map<String, dynamic> json)=>_$CreatedByFromJson(json);

  Map<String, dynamic> toJson()=>_$CreatedByToJson(this);
}