import 'package:json_annotation/json_annotation.dart';

part 'videos_model.g.dart';

@JsonSerializable()
class VideosModel {
  List<VideoModel> results;
  VideosModel({this.results});
  factory VideosModel.fromJson(Map<String, dynamic> jsonData) =>
      _$VideosModelFromJson(jsonData);

  Map<String, dynamic> toJson() => _$VideosModelToJson(this);
}

@JsonSerializable()
class VideoModel {
  String site;
  String key;
  String name;

  VideoModel({this.site, this.key, this.name});

  factory VideoModel.fromJson(Map<String, dynamic> jsonData) =>
      _$VideoModelFromJson(jsonData);

  Map<String, dynamic> toJson() => _$VideoModelToJson(this);
}
