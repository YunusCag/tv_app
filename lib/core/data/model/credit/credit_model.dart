import 'package:json_annotation/json_annotation.dart';

part 'credit_model.g.dart';

@JsonSerializable(createToJson: false)
class CreditModel {
  @JsonKey(name: "adult")
  bool? adult;
  @JsonKey(name: "gender")
  int? gender;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "known_for_department")
  String? knownForDepartment;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "original_name")
  String? originalName;
  @JsonKey(name: "popularity")
  double? popularity;
  @JsonKey(name: "profile_path")
  String? profilePath;
  @JsonKey(name: "character")
  String? character;
  @JsonKey(name: "credit_id")
  String? creditId;
  @JsonKey(name: "order")
  int? order;
  @JsonKey(name: "job")
  String? job;

  CreditModel({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.character,
    this.creditId,
    this.order,
    this.job,
  });

  factory CreditModel.fromJson(Map<String, dynamic> json) =>
      _$CreditModelFromJson(json);
}
