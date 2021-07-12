import 'package:json_annotation/json_annotation.dart';
import 'package:tv_app/core/data/model/credit/credit_model.dart';

part 'credit_response.g.dart';

@JsonSerializable(createToJson: false)
class CreditResponse {
  @JsonKey(name: "cast")
  List<CreditModel?>? cast;
  @JsonKey(name: "crew")
  List<CreditModel?>? crew;
  @JsonKey(name: "id")
  int? id;

  CreditResponse({
    this.id,
    this.cast,
    this.crew,
  });

  factory CreditResponse.fromJson(Map<String, dynamic> json) =>
      _$CreditResponseFromJson(json);
}
