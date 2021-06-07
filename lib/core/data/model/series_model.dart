import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'series_model.g.dart';

@JsonSerializable(explicitToJson: true)
class SeriesModel extends Equatable {
  @JsonKey(name: "backdrop_path")
  String? backdropPath;
  @JsonKey(name: "first_air_date")
  String? firstAirDate;
  @JsonKey(name: "genre_ids")
  List<int?>? genreIds;
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "name")
  String? name;
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
  @JsonKey(name: "vote_average")
  double? voteAverage;
  @JsonKey(name: "vote_count")
  int? voteCount;

  SeriesModel(
      {this.backdropPath,
      this.firstAirDate,
      this.genreIds,
      this.id,
      this.name,
      this.originCountry,
      this.originalLanguage,
      this.originalName,
      this.overview,
      this.popularity,
      this.posterPath,
      this.voteAverage,
      this.voteCount});

  factory SeriesModel.fromJson(Map<String, dynamic> json) =>
      _$SeriesModelFromJson(json);

  Map<String, dynamic> toJson() => _$SeriesModelToJson(this);

  @override
  List<Object?> get props => [id, name, backdropPath, posterPath];

  @override
  bool? get stringify => true;
}
