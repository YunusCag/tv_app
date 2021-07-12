// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideoResponse _$VideoResponseFromJson(Map<String, dynamic> json) {
  return VideoResponse(
    id: json['id'] as int?,
    videoList: (json['results'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : VideoModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}
