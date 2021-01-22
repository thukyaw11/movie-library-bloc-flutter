import 'package:json_annotation/json_annotation.dart';

part 'genres_model.g.dart';

@JsonSerializable()
class GenresModel {
  final List<GenreModel> genres;
  GenresModel({this.genres});

  factory GenresModel.fromJson(Map<String, dynamic> jsonData) =>
      _$GenresModelFromJson(jsonData);

  Map<String, dynamic> toJson() => _$GenresModelToJson(this);
}

@JsonSerializable()
class GenreModel {
  final int id;
  final String name;

  GenreModel({this.id, this.name});
  factory GenreModel.fromJson(Map<String, dynamic> jsonData) =>
      _$GenreModelFromJson(jsonData);

  Map<String, dynamic> toJson() => _$GenreModelToJson(this);
}
