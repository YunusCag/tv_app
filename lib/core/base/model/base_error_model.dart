import 'package:json_annotation/json_annotation.dart';

part 'base_error_model.g.dart';

@JsonSerializable(createToJson: false)
class BaseErrorModel {
  @JsonKey(name: "status_code")
  final int? statusCode;
  @JsonKey(name: "status_message")
  final String? message;
  @JsonKey(name: "success")
  final bool? success;

  BaseErrorModel({
    this.statusCode,
    this.message,
    this.success,
  });

  factory BaseErrorModel.fromJson(Map<String, dynamic> json) =>
      _$BaseErrorModelFromJson(json);
}
