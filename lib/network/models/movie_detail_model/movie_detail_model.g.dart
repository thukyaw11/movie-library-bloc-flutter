// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetail _$MovieDetailFromJson(Map<String, dynamic> json) {
  return MovieDetail(
    adult: json['adult'] as bool,
    backdropPath: json['backdrop_path'] as String,
    budget: json['budget'] as String,
    genres: json['genres'] == null
        ? null
        : Genres.fromJson(json['genres'] as Map<String, dynamic>),
    homepage: json['homepage'] as String,
    id: json['id'] as int,
    originalLang: json['original_language'] as String,
    originalTitle: json['original_title'] as String,
    overview: json['overview'] as String,
    popularity: (json['popularity'] as num)?.toDouble(),
    posterPath: json['poster_path'] as String,
    companies: json['production_companies'] == null
        ? null
        : ProductionCompanies.fromJson(
            json['production_companies'] as Map<String, dynamic>),
    countries: json['production_countries'] == null
        ? null
        : ProductionCountries.fromJson(
            json['production_countries'] as Map<String, dynamic>),
    releaseDate: json['release_date'] as String,
    revenue: json['revenue'] == null
        ? null
        : BigInt.parse(json['revenue'] as String),
    runtime: json['runtime'] as int,
    spokenLang: json['spoken_languages'] == null
        ? null
        : SpokenLang.fromJson(json['spoken_languages'] as Map<String, dynamic>),
    status: json['status'] as String,
    tagline: json['tagline'] as String,
    title: json['title'] as String,
    voteAvg: (json['vote_average'] as num)?.toDouble(),
    voteCount: json['voue_count'] as int,
  );
}

Map<String, dynamic> _$MovieDetailToJson(MovieDetail instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'backdrop_path': instance.backdropPath,
      'budget': instance.budget,
      'genres': instance.genres,
      'homepage': instance.homepage,
      'id': instance.id,
      'original_language': instance.originalLang,
      'original_title': instance.originalTitle,
      'overview': instance.overview,
      'popularity': instance.popularity,
      'poster_path': instance.posterPath,
      'production_companies': instance.companies,
      'production_countries': instance.countries,
      'release_date': instance.releaseDate,
      'revenue': instance.revenue?.toString(),
      'runtime': instance.runtime,
      'spoken_languages': instance.spokenLang,
      'status': instance.status,
      'tagline': instance.tagline,
      'title': instance.title,
      'vote_average': instance.voteAvg,
      'voue_count': instance.voteCount,
    };

Genres _$GenresFromJson(Map<String, dynamic> json) {
  return Genres(
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$GenresToJson(Genres instance) => <String, dynamic>{
      'name': instance.name,
    };

ProductionCompanies _$ProductionCompaniesFromJson(Map<String, dynamic> json) {
  return ProductionCompanies(
    id: json['id'] as int,
    logoPath: json['logo_path'] as String,
    name: json['name'] as String,
    originCountry: json['origin_country'] as String,
  );
}

Map<String, dynamic> _$ProductionCompaniesToJson(
        ProductionCompanies instance) =>
    <String, dynamic>{
      'id': instance.id,
      'logo_path': instance.logoPath,
      'name': instance.name,
      'origin_country': instance.originCountry,
    };

ProductionCountries _$ProductionCountriesFromJson(Map<String, dynamic> json) {
  return ProductionCountries(
    countryCode: json['iso_3166_1'] as String,
  );
}

Map<String, dynamic> _$ProductionCountriesToJson(
        ProductionCountries instance) =>
    <String, dynamic>{
      'iso_3166_1': instance.countryCode,
    };

SpokenLang _$SpokenLangFromJson(Map<String, dynamic> json) {
  return SpokenLang(
    engName: json['english_name'] as String,
  );
}

Map<String, dynamic> _$SpokenLangToJson(SpokenLang instance) =>
    <String, dynamic>{
      'english_name': instance.engName,
    };
