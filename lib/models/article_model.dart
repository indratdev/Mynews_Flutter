import 'package:json_annotation/json_annotation.dart';

part 'article_model.g.dart';

@JsonSerializable()
class ArticleModel {
  String? author, title, description, url, urlToImage, content;
  DateTime publishedAt;

  ArticleModel({
    required this.author,
    required this.content,
    required this.description,
    required this.publishedAt,
    required this.title,
    required this.url,
    required this.urlToImage,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) =>
      _$ArticleModelFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ArticleModelToJson(this);
}
