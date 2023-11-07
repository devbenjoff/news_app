import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/features/home/data/models/source_response.dart';

part 'news_response.g.dart';

@JsonSerializable()
class NewsResponse {
  final String? author;
  final String? title;
  final String? description;
  final String? url;
  final String? urlToImage;
  final String? publishedAt;
  final String? content;
  final SourceResponse source;

  NewsResponse(
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
    this.source,
  );

  factory NewsResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsResponseFromJson(json);
}
