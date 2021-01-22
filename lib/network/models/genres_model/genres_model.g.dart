// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GenresModel _$GenresModelFromJson(Map<String, dynamic> json) {
  return GenresModel(
    genres: (json['genres'] as List)
        ?.map((e) =>
            e == null ? null : GenreModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$GenresModelToJson(GenresModel instance) =>
    <String, dynamic>{
      'genres': instance.genres,
    };

GenreModel _$GenreModelFromJson(Map<String, dynamic> json) {
  return GenreModel(
    id: json['id'] as int,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$GenreModelToJson(GenreModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
