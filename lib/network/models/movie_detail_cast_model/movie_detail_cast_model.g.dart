// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_cast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailCastModel _$MovieDetailCastModelFromJson(Map<String, dynamic> json) {
  return MovieDetailCastModel(
    gender: json['gender'] as int,
    name: json['name'] as String,
    originalName: json['original_name'] as String,
    profilePath: json['profile_path'] as String,
    popularity: (json['popularity'] as num)?.toDouble(),
    id: json['id'] as int,
    character: json['character'] as String,
  );
}

Map<String, dynamic> _$MovieDetailCastModelToJson(
        MovieDetailCastModel instance) =>
    <String, dynamic>{
      'gender': instance.gender,
      'name': instance.name,
      'original_name': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'id': instance.id,
      'character': instance.character,
    };
