// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_detail_cast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesDetailCastModel _$MoviesDetailCastModelFromJson(
    Map<String, dynamic> json) {
  return MoviesDetailCastModel(
    casts: (json['cast'] as List)
        ?.map((e) => e == null
            ? null
            : MovieDetailCastModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MoviesDetailCastModelToJson(
        MoviesDetailCastModel instance) =>
    <String, dynamic>{
      'cast': instance.casts,
    };
