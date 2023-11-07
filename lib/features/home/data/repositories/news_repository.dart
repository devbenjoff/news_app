import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/common/data/api_client.dart';
import 'package:news_app/common/data/entity_mapper.dart';
import 'package:news_app/common/data/providers.dart';
import 'package:news_app/common/domain/either_failure_or.dart';
import 'package:news_app/common/domain/entities/failure.dart';
import 'package:news_app/features/home/data/mappers/news_entity_mapper.dart';
import 'package:news_app/features/home/data/models/news_response.dart';
import 'package:news_app/features/home/domain/entities/news.dart';

final newsRepositoryProvider = Provider<NewsRepository>(
  (ref) => NewsRepositoryImpl(
    ref.watch(apiClientProvider),
    ref.watch(newsEntityMapperProvider),
  ),
);

abstract class NewsRepository {
  EitherFailureOr<List<News>> getNews();
}

class NewsRepositoryImpl implements NewsRepository {
  final ApiClient _apiClient;
  final EntityMapper<News, NewsResponse> _newsEntityMapper;

  NewsRepositoryImpl(
    this._apiClient,
    this._newsEntityMapper,
  );

  @override
  EitherFailureOr<List<News>> getNews() async {
    try {
      final newsListResponse = await _apiClient.getNews();
      final newsList = newsListResponse.articles
          .map((newsResponse) => _newsEntityMapper(newsResponse))
          .where((element) => element.title != '[Removed]')
          .toList();

      return Right(newsList);
    } catch (error, stackTrace) {
      return Left(
        Failure.generic(error: error, stackTrace: stackTrace),
      );
    }
  }
}
