import 'package:json_annotation/json_annotation.dart';

part 'movie_detail_model.g.dart';

@JsonSerializable()
class MovieDetail {
  bool adult;
  @JsonKey(name: 'backdrop_path')
  String backdropPath;
  int budget;
  List<Genres> genres;
  String homepage;
  int id;
  @JsonKey(name: 'original_language')
  String originalLang;
  @JsonKey(name: 'original_title')
  String originalTitle;
  String overview;
  double popularity;
  @JsonKey(name: 'poster_path')
  String posterPath;
  @JsonKey(name: 'production_companies')
  List<ProductionCompanies> companies;
  @JsonKey(name: "production_countries")
  List<ProductionCountries> countries;
  @JsonKey(name: "release_date")
  String releaseDate;
  int revenue;
  int runtime;
  @JsonKey(name: 'spoken_languages')
  List<SpokenLang> spokenLang;
  String status;
  String tagline;
  String title;
  @JsonKey(name: 'vote_average')
  double voteAvg;
  @JsonKey(name: 'vote_count')
  int voteCount;

  MovieDetail(
      {this.adult,
      this.backdropPath,
      this.budget,
      this.genres,
      this.homepage,
      this.id,
      this.originalLang,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.companies,
      this.countries,
      this.releaseDate,
      this.revenue,
      this.runtime,
      this.spokenLang,
      this.status,
      this.tagline,
      this.title,
      this.voteAvg,
      this.voteCount});

  factory MovieDetail.fromJson(Map<String, dynamic> jsonData) =>
      _$MovieDetailFromJson(jsonData);

  Map<String, dynamic> toJson() => _$MovieDetailToJson(this);
}

@JsonSerializable()
class Genres {
  String name;

  Genres({this.name});

  factory Genres.fromJson(Map<String, dynamic> jsonData) =>
      _$GenresFromJson(jsonData);

  Map<String, dynamic> toJson() => _$GenresToJson(this);
}

@JsonSerializable()
class ProductionCompanies {
  int id;
  @JsonKey(name: "logo_path")
  String logoPath;
  String name;
  @JsonKey(name: "origin_country")
  String originCountry;

  ProductionCompanies({this.id, this.logoPath, this.name, this.originCountry});

  factory ProductionCompanies.fromJson(Map<String, dynamic> jsonData) =>
      _$ProductionCompaniesFromJson(jsonData);

  Map<String, dynamic> toJson() => _$ProductionCompaniesToJson(this);
}

@JsonSerializable()
class ProductionCountries {
  @JsonKey(name: "iso_3166_1")
  String countryCode;

  ProductionCountries({this.countryCode});

  factory ProductionCountries.fromJson(Map<String, dynamic> jsonData) =>
      _$ProductionCountriesFromJson(jsonData);

  Map<String, dynamic> toJson() => _$ProductionCountriesToJson(this);
}

@JsonSerializable()
class SpokenLang {
  @JsonKey(name: 'english_name')
  String engName;

  SpokenLang({this.engName});

  factory SpokenLang.fromJson(Map<String, dynamic> jsonData) =>
      _$SpokenLangFromJson(jsonData);

  Map<String, dynamic> toJson() => _$SpokenLangToJson(this);
}
