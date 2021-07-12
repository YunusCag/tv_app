import 'package:json_annotation/json_annotation.dart';

part 'video_model.g.dart';

@JsonSerializable(createToJson: false)
class VideoModel {
  @JsonKey(name:"id")
  String? id;
  @JsonKey(name: "iso_3166_1")
  String? iso_3166_1;
  @JsonKey(name: "iso_639_1")
  String? iso_639_1;
  @JsonKey(name: "key")
  String? key;
  @JsonKey(name:"name")
  String? name;
  @JsonKey(name:"site")
  String? site;
  @JsonKey(name: "size")
  int? size;
  @JsonKey(name: "type")
  String? type;

  VideoModel({this.id, this.iso_3166_1, this.iso_639_1, this.key, this.name, this.site, this.size, this.type});

  factory VideoModel.fromJson(Map<String, dynamic> json)=>_$VideoModelFromJson(json);

}