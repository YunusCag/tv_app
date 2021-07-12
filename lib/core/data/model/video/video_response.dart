import 'package:json_annotation/json_annotation.dart';
import 'package:tv_app/core/data/model/video/video_model.dart';

part 'video_response.g.dart';

@JsonSerializable(createToJson: false)
class VideoResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "results")
  List<VideoModel?>? videoList;

  VideoResponse({
    this.id,
    this.videoList,
  });

  factory VideoResponse.fromJson(Map<String, dynamic> json) =>
      _$VideoResponseFromJson(json);
}
