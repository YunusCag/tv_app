import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'season.g.dart';

@JsonSerializable(explicitToJson: true)
class Season extends Equatable{
  @JsonKey(name: "air_date")
  String? airDate;
  @JsonKey(name: "episode_count")
  int? episodeCount;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "overview")
  String? overview;
  @JsonKey(name: "poster_path")
  String? posterPath;
  @JsonKey(name: "season_number")
  int? seasonNumber;

  Season(
      {this.airDate,
      this.episodeCount,
      this.id,
      this.name,
      this.overview,
      this.posterPath,
      this.seasonNumber});

  factory Season.fromJson(Map<String, dynamic> json) => _$SeasonFromJson(json);

  Map<String, dynamic> toJson() => _$SeasonToJson(this);

  @override
  List<Object?> get props => [id,name];

  @override
  bool? get stringify => true;
}
