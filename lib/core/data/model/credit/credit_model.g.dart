// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'credit_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreditModel _$CreditModelFromJson(Map<String, dynamic> json) {
  return CreditModel(
    adult: json['adult'] as bool?,
    gender: json['gender'] as int?,
    id: json['id'] as int?,
    knownForDepartment: json['known_for_department'] as String?,
    name: json['name'] as String?,
    originalName: json['original_name'] as String?,
    popularity: (json['popularity'] as num?)?.toDouble(),
    profilePath: json['profile_path'] as String?,
    character: json['character'] as String?,
    creditId: json['credit_id'] as String?,
    order: json['order'] as int?,
    job: json['job'] as String?,
  );
}
