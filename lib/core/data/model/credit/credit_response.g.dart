// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditResponse _$CreditResponseFromJson(Map<String, dynamic> json) {
  return CreditResponse(
    id: json['id'] as int?,
    cast: (json['cast'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : CreditModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    crew: (json['crew'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : CreditModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}
