// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top_rated_series_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TopRatedSeriesResponseModel _$TopRatedSeriesResponseModelFromJson(
    Map<String, dynamic> json) {
  return TopRatedSeriesResponseModel(
    page: json['page'] as int?,
    topRatedList: (json['results'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : SeriesModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    totalPages: json['total_pages'] as int?,
    totalResults: json['total_results'] as int?,
  );
}

Map<String, dynamic> _$TopRatedSeriesResponseModelToJson(
        TopRatedSeriesResponseModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.topRatedList,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
