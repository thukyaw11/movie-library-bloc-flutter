import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/network/models/movies_model.dart';
part 'cast_model.g.dart';

@JsonSerializable()
class CastModel {
  bool adult;
  int gender;
  int id;
  @JsonKey(name: "known_for")
  List<MoviesModel> knownFor;
  @JsonKey(name: "known_for_department")
  String knownForDepartMent;
  String name;
  double popularity;
  @JsonKey(name: "profile_path")
  String profilePath;

  CastModel(
      {this.adult,
      this.gender,
      this.id,
      this.knownFor,
      this.knownForDepartMent,
      this.name,
      this.popularity,
      this.profilePath});

  factory CastModel.fromJson(Map<String, dynamic> jsonData) =>
      _$CastModelFromJson(jsonData);

  Map<String, dynamic> toJson() => _$CastModelToJson(this);
}
