import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'created_by.dart';
import 'genre.dart';
import 'last_episode_to_air.dart';
import 'next_episode_to_air.dart';
import 'network.dart';
import 'production_country.dart';
import 'season.dart';

part 'series_detail_response_model.g.dart';

@JsonSerializable()
class SeriesDetailResponseModel extends Equatable {
  @JsonKey(name: "backdrop_path")
  String? backdropPath;
  @JsonKey(name: "created_by")
  List<CreatedBy>? createdBy;
  @JsonKey(name: "episode_run_time")
  List<int?>? episodeRunTime;
  @JsonKey(name: "first_air_date")
  String? firstAirDate;
  @JsonKey(name: "genres")
  List<Genre?>? genres;
  @JsonKey(name: "homepage")
  String? homepage;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "in_production")
  bool? inProduction;
  @JsonKey(name: "languages")
  List<String>? languages;
  @JsonKey(name: "last_air_date")
  String? lastAirDate;
  @JsonKey(name: "last_episode_to_air")
  LastEpisodeToAir? lastEpisodeToAir;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "next_episode_to_air")
  NextEpisodeToAir? nextEpisodeToAir;
  @JsonKey(name: "networks")
  List<Network?>? networks;
  @JsonKey(name: "number_of_episodes")
  int? numberOfEpisodes;
  @JsonKey(name: "number_of_seasons")
  int? numberOfSeasons;
  @JsonKey(name: "origin_country")
  List<String?>? originCountry;
  @JsonKey(name: "original_language")
  String? originalLanguage;
  @JsonKey(name: "original_name")
  String? originalName;
  @JsonKey(name: "overview")
  String? overview;
  @JsonKey(name: "popularity")
  double? popularity;
  @JsonKey(name: "poster_path")
  String? posterPath;
  @JsonKey(name: "production_companies")
  List<ProductionCountry?>? productionCountries;
  @JsonKey(name: "seasons")
  List<Season?>? seasons;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "tagline")
  String? tagLine;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "vote_average")
  double? voteAverage;
  @JsonKey(name: "vote_count")
  int? voteCount;

  SeriesDetailResponseModel(
      {this.backdropPath,
      this.createdBy,
      this.episodeRunTime,
      this.firstAirDate,
      this.genres,
      this.homepage,
      this.id,
      this.inProduction,
      this.languages,
      this.lastAirDate,
      this.lastEpisodeToAir,
      this.name,
      this.nextEpisodeToAir,
      this.networks,
      this.numberOfEpisodes,
      this.numberOfSeasons,
      this.originCountry,
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.popularity,
      this.posterPath,
      this.productionCountries,
      this.seasons,
      this.status,
      this.tagLine,
      this.type,
      this.voteAverage,
      this.voteCount});

  factory SeriesDetailResponseModel.fromJson(Map<String, dynamic> json)=>_$SeriesDetailResponseModelFromJson(json);

  Map<String, dynamic> toJson()=>_$SeriesDetailResponseModelToJson(this);

  @override
  List<Object?> get props => [name,id];

  @override
  bool? get stringify => true;
}










