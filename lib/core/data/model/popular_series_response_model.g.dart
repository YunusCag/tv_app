// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_series_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularSeriesResponseModel _$PopularSeriesResponseModelFromJson(
    Map<String, dynamic> json) {
  return PopularSeriesResponseModel(
    page: json['page'] as int?,
    popularList: (json['results'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : SeriesModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    totalPages: json['total_pages'] as int?,
    totalResults: json['total_results'] as int?,
  );
}

Map<String, dynamic> _$PopularSeriesResponseModelToJson(
        PopularSeriesResponseModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'results': instance.popularList,
      'total_pages': instance.totalPages,
      'total_results': instance.totalResults,
    };
