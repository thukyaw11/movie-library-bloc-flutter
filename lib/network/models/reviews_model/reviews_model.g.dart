// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviews_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewsModel _$ReviewsModelFromJson(Map<String, dynamic> json) {
  return ReviewsModel(
    results: (json['results'] as List)
        ?.map((e) =>
            e == null ? null : ReviewModel.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$ReviewsModelToJson(ReviewsModel instance) =>
    <String, dynamic>{
      'results': instance.results,
    };

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) {
  return ReviewModel(
    author: json['author'] as String,
    content: json['content'] as String,
    authorDetails: json['authorDetails'] == null
        ? null
        : AuthorDetails.fromJson(json['authorDetails'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'author': instance.author,
      'content': instance.content,
      'authorDetails': instance.authorDetails,
    };

AuthorDetails _$AuthorDetailsFromJson(Map<String, dynamic> json) {
  return AuthorDetails(
    username: json['username'] as String,
    avatarPath: json['avatar_path'] as String,
  );
}

Map<String, dynamic> _$AuthorDetailsToJson(AuthorDetails instance) =>
    <String, dynamic>{
      'username': instance.username,
      'avatar_path': instance.avatarPath,
    };
