import 'package:json_annotation/json_annotation.dart';

part 'last_episode_to_air.g.dart';

@JsonSerializable(explicitToJson: true)
class LastEpisodeToAir {
  @JsonKey(name: "air_date")
  String? airDate;
  @JsonKey(name: "episode_number")
  int? episodeNumber;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "overview")
  String? overview;
  @JsonKey(name: "production_code")
  String? productionCode;
  @JsonKey(name: "season_number")
  int? seasonNumber;
  @JsonKey(name: "still_path")
  String? stillPath;
  @JsonKey(name: "vote_average")
  double? voteAverage;
  @JsonKey(name: "vote_count")
  int? voteCount;

  LastEpisodeToAir(
      {this.airDate,
      this.episodeNumber,
      this.id,
      this.name,
      this.overview,
      this.productionCode,
      this.seasonNumber,
      this.stillPath,
      this.voteAverage,
      this.voteCount});

  factory LastEpisodeToAir.fromJson(Map<String, dynamic> json) =>
      _$LastEpisodeToAirFromJson(json);

  Map<String, dynamic> toJson() => _$LastEpisodeToAirToJson(this);
}
