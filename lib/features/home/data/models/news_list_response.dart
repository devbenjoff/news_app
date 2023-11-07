import 'package:json_annotation/json_annotation.dart';
import 'package:news_app/features/home/data/models/news_response.dart';

part 'news_list_response.g.dart';

@JsonSerializable()
class NewsListResponse {
  final String status;
  final int totalResults;
  final List<NewsResponse> articles;

  NewsListResponse(
    this.status,
    this.totalResults,
    this.articles,
  );

  factory NewsListResponse.fromJson(Map<String, dynamic> json) =>
      _$NewsListResponseFromJson(json);
}
