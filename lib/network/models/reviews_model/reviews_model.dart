import 'package:json_annotation/json_annotation.dart';

part 'reviews_model.g.dart';

@JsonSerializable()
class ReviewsModel {
  List<ReviewModel> results;
  ReviewsModel({this.results});

  factory ReviewsModel.fromJson(Map<String, dynamic> jsonData) =>
      _$ReviewsModelFromJson(jsonData);

  Map<String, dynamic> toJson() => _$ReviewsModelToJson(this);
}

@JsonSerializable()
class ReviewModel {
  String author;
  String content;
  AuthorDetails authorDetails;
  ReviewModel({this.author, this.content, this.authorDetails});
  factory ReviewModel.fromJson(Map<String, dynamic> jsonData) =>
      _$ReviewModelFromJson(jsonData);

  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);
}

@JsonSerializable()
class AuthorDetails {
  String username;
  @JsonKey(name: 'avatar_path')
  String avatarPath;

  AuthorDetails({this.username, this.avatarPath});

  factory AuthorDetails.fromJson(Map<String, dynamic> jsonData) =>
      _$AuthorDetailsFromJson(jsonData);

  Map<String, dynamic> toJson() => _$AuthorDetailsToJson(this);
}
