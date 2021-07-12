// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_detail_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SeriesDetailResponseModel _$SeriesDetailResponseModelFromJson(
    Map<String, dynamic> json) {
  return SeriesDetailResponseModel(
    backdropPath: json['backdrop_path'] as String?,
    createdBy: (json['created_by'] as List<dynamic>?)
        ?.map((e) => CreatedBy.fromJson(e as Map<String, dynamic>))
        .toList(),
    episodeRunTime: (json['episode_run_time'] as List<dynamic>?)
        ?.map((e) => e as int?)
        .toList(),
    firstAirDate: json['first_air_date'] as String?,
    genres: (json['genres'] as List<dynamic>?)
        ?.map(
            (e) => e == null ? null : Genre.fromJson(e as Map<String, dynamic>))
        .toList(),
    homepage: json['homepage'] as String?,
    id: json['id'] as int?,
    inProduction: json['in_production'] as bool?,
    languages:
        (json['languages'] as List<dynamic>?)?.map((e) => e as String).toList(),
    lastAirDate: json['last_air_date'] as String?,
    lastEpisodeToAir: json['last_episode_to_air'] == null
        ? null
        : LastEpisodeToAir.fromJson(
            json['last_episode_to_air'] as Map<String, dynamic>),
    name: json['name'] as String?,
    nextEpisodeToAir: json['next_episode_to_air'] == null
        ? null
        : NextEpisodeToAir.fromJson(
            json['next_episode_to_air'] as Map<String, dynamic>),
    networks: (json['networks'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Network.fromJson(e as Map<String, dynamic>))
        .toList(),
    numberOfEpisodes: json['number_of_episodes'] as int?,
    numberOfSeasons: json['number_of_seasons'] as int?,
    originCountry: (json['origin_country'] as List<dynamic>?)
        ?.map((e) => e as String?)
        .toList(),
    originalLanguage: json['original_language'] as String?,
    originalName: json['original_name'] as String?,
    overview: json['overview'] as String?,
    popularity: (json['popularity'] as num?)?.toDouble(),
    posterPath: json['poster_path'] as String?,
    productionCountries: (json['production_companies'] as List<dynamic>?)
        ?.map((e) => e == null
            ? null
            : ProductionCountry.fromJson(e as Map<String, dynamic>))
        .toList(),
    seasons: (json['seasons'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Season.fromJson(e as Map<String, dynamic>))
        .toList(),
    status: json['status'] as String?,
    tagLine: json['tagline'] as String?,
    type: json['type'] as String?,
    voteAverage: (json['vote_average'] as num?)?.toDouble(),
    voteCount: json['vote_count'] as int?,
  );
}

Map<String, dynamic> _$SeriesDetailResponseModelToJson(
        SeriesDetailResponseModel instance) =>
    <String, dynamic>{
      'backdrop_path': instance.backdropPath,
      'created_by': instance.createdBy,
      'episode_run_time': instance.episodeRunTime,
      'first_air_date': instance.firstAirDate,
      'genres': instance.genres,
      'homepage': instance.homepage,
      'id': instance.id,
      'in_production': instance.inProduction,
      'languages': instance.languages,
      'last_air_date': instance.lastAirDate,
      'last_episode_to_air': instance.lastEpisodeToAir,
      'name': instance.name,
      'next_episode_to_air': instance.nextEpisodeToAir,
      'networks': instance.networks,
      'number_of_episodes': instance.numberOfEpisodes,
      'number_of_seasons': instance.numberOfSeasons,
      'origin_country': instance.originCountry,
      'original_language': instance.originalLanguage,
      'original_name': instance.originalName,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'production_companies': instance.productionCountries,
      'seasons': instance.seasons,
      'status': instance.status,
      'tagline': instance.tagLine,
      'type': instance.type,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
