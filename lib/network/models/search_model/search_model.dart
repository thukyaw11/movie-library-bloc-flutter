import 'package:json_annotation/json_annotation.dart';
import 'package:movie_app/network/models/movie_model/movie_model.dart';

part 'search_model.g.dart';

@JsonSerializable()
class SearchModel {
  @JsonKey(name: "results")
  List<MovieModel> searchResults;

  SearchModel({this.searchResults});

  factory SearchModel.fromJson(Map<String, dynamic> json) =>
      _$SearchModelFromJson(json);

  Map<String, dynamic> toJson() => _$SearchModelToJson(this);
}
