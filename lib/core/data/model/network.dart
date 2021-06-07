import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'network.g.dart';
@JsonSerializable(explicitToJson: true)
class Network extends Equatable{
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "logo_path")
  String? logoPath;
  @JsonKey(name: "origin_country")
  String? originCountry;

  Network({this.name, this.id, this.logoPath, this.originCountry});

  factory Network.fromJson(Map<String, dynamic> json)=>_$NetworkFromJson(json);

  Map<String, dynamic> toJson()=>_$NetworkToJson(this);

  @override
  List<Object?> get props => [id,name];

  @override
  bool? get stringify => true;
}