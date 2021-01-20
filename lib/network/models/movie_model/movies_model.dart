import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/network/models/movie_model/movie_model.dart';

part 'movies_model.g.dart';

@JsonSerializable()
class MoviesModel {
  @JsonKey(name: "results")
  List<MovieModel> movie;

  MoviesModel({this.movie});

  factory MoviesModel.fromJson(Map<String, dynamic> json) =>
      _$MoviesModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoviesModelToJson(this);
}
