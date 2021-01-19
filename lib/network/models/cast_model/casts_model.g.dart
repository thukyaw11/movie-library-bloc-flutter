// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'casts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CastsModel _$CastsModelFromJson(Map<String, dynamic> json) {
  return CastsModel(
    casts: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : CastModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$CastsModelToJson(CastsModel instance) =>
    <String, dynamic>{
      'results': instance.casts,
    };
