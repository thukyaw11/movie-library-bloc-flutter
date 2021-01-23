// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies_by_cast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoviesByCastModel _$MoviesByCastModelFromJson(Map<String, dynamic> json) {
  return MoviesByCastModel(
    castMovieList: (json['cast'] as List)
        ?.map((e) =>
            e == null ? null : MovieModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$MoviesByCastModelToJson(MoviesByCastModel instance) =>
    <String, dynamic>{
      'cast': instance.castMovieList,
    };
