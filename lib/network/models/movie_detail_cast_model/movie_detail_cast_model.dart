import 'package:json_annotation/json_annotation.dart';

part 'movie_detail_cast_model.g.dart';

@JsonSerializable()
class MovieDetailCastModel {
  int gender;
  String name;
  @JsonKey(name: "original_name")
  String originalName;
  double popularity;
  @JsonKey(name: "profile_path")
  String profilePath;
  int id;
  String character;

  MovieDetailCastModel(
      {this.gender,
      this.name,
      this.originalName,
      this.profilePath,
      this.popularity,
      this.id,
      this.character});

  factory MovieDetailCastModel.fromJson(Map<String, dynamic> jsonData) =>
      _$MovieDetailCastModelFromJson(jsonData);

  Map<String, dynamic> toJson() => _$MovieDetailCastModelToJson(this);
}
