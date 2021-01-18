// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastModel _$CastModelFromJson(Map<String, dynamic> json) {
  return CastModel(
    adult: json['adult'] as bool,
    gender: json['gender'] as int,
    id: json['id'] as int,
    knownFor: (json['known_for'] as List)
        ?.map((e) =>
            e == null ? null : MoviesModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
    knownForDepartMent: json['known_for_department'] as String,
    name: json['name'] as String,
    popularity: (json['popularity'] as num)?.toDouble(),
    profilePath: json['profile_path'] as String,
  );
}

Map<String, dynamic> _$CastModelToJson(CastModel instance) => <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'known_for': instance.knownFor,
      'known_for_department': instance.knownForDepartMent,
      'name': instance.name,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
    };
