// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'videos_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VideosModel _$VideosModelFromJson(Map<String, dynamic> json) {
  return VideosModel(
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : VideoModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$VideosModelToJson(VideosModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

VideoModel _$VideoModelFromJson(Map<String, dynamic> json) {
  return VideoModel(
    site: json['site'] as String,
    key: json['key'] as String,
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$VideoModelToJson(VideoModel instance) =>
    <String, dynamic>{
      'site': instance.site,
      'key': instance.key,
      'name': instance.name,
    };
