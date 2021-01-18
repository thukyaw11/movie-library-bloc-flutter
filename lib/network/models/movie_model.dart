import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
part 'movie_model.g.dart';

@JsonSerializable()
class MovieModel extends Equatable {
  bool adult;
  @JsonKey(name: "backdrop_path")
  String backdropPath;
  int id;
  @JsonKey(name: "genre_ids")
  List<int> genreIds;
  @JsonKey(name: "original_language")
  String originalLanguage;
  @JsonKey(name: "original_title")
  String originalTitle;
  String overview;
  double popularity;
  @JsonKey(name: "poster_path")
  String posterPath;
  @JsonKey(name: "release_date")
  String releaseDate;
  String title;
  bool video;
  @JsonKey(name: "vote_average")
  double voteAverage;
  @JsonKey(name: "vote_count")
  int voteCount;

  MovieModel(
      {this.adult,
      this.backdropPath,
      this.id,
      this.genreIds,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});
  factory MovieModel.fromJson(Map<String, dynamic> json) =>
      _$MovieModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);

  @override
  List<Object> get props => [
        adult,
        backdropPath,
        id,
        genreIds,
        originalLanguage,
        originalTitle,
        overview,
        popularity,
        posterPath,
        releaseDate,
        title,
        video,
        voteAverage,
        voteCount
      ];
}
