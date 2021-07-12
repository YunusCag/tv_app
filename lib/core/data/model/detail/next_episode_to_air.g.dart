// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'next_episode_to_air.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NextEpisodeToAir _$NextEpisodeToAirFromJson(Map<String, dynamic> json) {
  return NextEpisodeToAir(
    airDate: json['air_date'] as String?,
    episodeNumber: json['episode_number'] as int?,
    id: json['id'] as int?,
    name: json['name'] as String?,
    overview: json['overview'] as String?,
    productionCode: json['production_code'] as String?,
    seasonNumber: json['season_number'] as int?,
    voteAverage: (json['vote_average'] as num?)?.toDouble(),
    voteCount: json['vote_count'] as int?,
  );
}

Map<String, dynamic> _$NextEpisodeToAirToJson(NextEpisodeToAir instance) =>
    <String, dynamic>{
      'air_date': instance.airDate,
      'episode_number': instance.episodeNumber,
      'id': instance.id,
      'name': instance.name,
      'overview': instance.overview,
      'production_code': instance.productionCode,
      'season_number': instance.seasonNumber,
      'vote_average': instance.voteAverage,
      'vote_count': instance.voteCount,
    };
