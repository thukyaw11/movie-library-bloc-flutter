import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/network/models/cast_model/cast_model.dart';

part 'casts_model.g.dart';

@JsonSerializable()
class CastsModel {
  @JsonKey(name: "results")
  List<CastModel> casts;

  CastsModel({this.casts});

  factory CastsModel.fromJson(Map<String, dynamic> jsonData) =>
      _$CastsModelFromJson(jsonData);

  Map<String, dynamic> toJson() => _$CastsModelToJson(this);
}
