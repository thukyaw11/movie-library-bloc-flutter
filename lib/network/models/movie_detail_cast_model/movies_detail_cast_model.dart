import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/network/models/movie_detail_cast_model/movie_detail_cast_model.dart';

part 'movies_detail_cast_model.g.dart';

@JsonSerializable()
class MoviesDetailCastModel {
  @JsonKey(name: "cast")
  List<MovieDetailCastModel> casts;

  MoviesDetailCastModel({this.casts});

  factory MoviesDetailCastModel.fromJson(Map<String, dynamic> jsonData) =>
      _$MoviesDetailCastModelFromJson(jsonData);

  Map<String, dynamic> toJson() => _$MoviesDetailCastModelToJson(this);
}
