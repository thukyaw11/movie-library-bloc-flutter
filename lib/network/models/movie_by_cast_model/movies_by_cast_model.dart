import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/network/models/movie_model/movie_model.dart';

part 'movies_by_cast_model.g.dart';

@JsonSerializable()
class MoviesByCastModel {
  @JsonKey(name: "cast")
  List<MovieModel> castMovieList;

  MoviesByCastModel({this.castMovieList});

  factory MoviesByCastModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesByCastModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesByCastModelToJson(this);
}
