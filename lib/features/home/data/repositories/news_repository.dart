import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/common/data/api_client.dart';
import 'package:news_app/common/data/entity_mapper.dart';
import 'package:news_app/common/data/providers.dart';
import 'package:news_app/features/home/data/mappers/news_entity_mapper.dart';
import 'package:news_app/features/home/data/models/news_response.dart';
import 'package:news_app/features/home/domain/entities/news.dart';
import 'package:news_app/features/home/domain/entities/news_list.dart';

final newsRepositoryProvider = Provider<NewsRepository>(
  (ref) => NewsRepositoryImpl(
    ref.watch(apiClientProvider),
    ref.watch(newsEntityMapperProvider),
  ),
);

abstract class NewsRepository {
  Future<NewsList> getNews();
}

class NewsRepositoryImpl implements NewsRepository {
  final ApiClient _apiClient;
  final EntityMapper<News, NewsResponse> _newsEntityMapper;

  NewsRepositoryImpl(
    this._apiClient,
    this._newsEntityMapper,
  );

  @override
  Future<NewsList> getNews() async {
    final newsListResponse = await _apiClient.getNews();
    final newsList = newsListResponse.articles
        .map((newsResponse) => _newsEntityMapper(newsResponse))
        .where((element) => element.title != '[Removed]')
        .toList();

    return NewsList(newsList);
  }
}
