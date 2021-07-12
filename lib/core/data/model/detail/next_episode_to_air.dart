import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'next_episode_to_air.g.dart';

@JsonSerializable(explicitToJson: true)
class NextEpisodeToAir extends Equatable{
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
  @JsonKey(name: "vote_average")
  double? voteAverage;
  @JsonKey(name: "vote_count")
  int? voteCount;

  NextEpisodeToAir(
      {this.airDate,
      this.episodeNumber,
      this.id,
      this.name,
      this.overview,
      this.productionCode,
      this.seasonNumber,
      this.voteAverage,
      this.voteCount});

  factory NextEpisodeToAir.fromJson(Map<String, dynamic> json) =>
      _$NextEpisodeToAirFromJson(json);

  Map<String, dynamic> toJson() => _$NextEpisodeToAirToJson(this);

  @override
  List<Object?> get props =>[id,name];

  @override
  bool? get stringify => true;
}
