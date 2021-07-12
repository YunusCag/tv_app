import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'production_country.g.dart';
@JsonSerializable(explicitToJson: true)
class ProductionCountry extends Equatable{
  @JsonKey(name: "iso_3166_1")
  String? iso31661;
  @JsonKey(name: "name")
  String? name;

  ProductionCountry({this.iso31661, this.name});

  factory ProductionCountry.fromJson(Map<String, dynamic> json)=>_$ProductionCountryFromJson(json);

  Map<String, dynamic> toJson()=>_$ProductionCountryToJson(this);

  @override
  List<Object?> get props => [name,iso31661];

  @override
  bool? get stringify => true;


}