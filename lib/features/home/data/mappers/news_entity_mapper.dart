import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/common/data/entity_mapper.dart';
import 'package:news_app/features/home/data/mappers/source_entity_mapper.dart';
import 'package:news_app/features/home/data/models/news_response.dart';
import 'package:news_app/features/home/domain/entities/news.dart';

final newsEntityMapperProvider = Provider<EntityMapper<News, NewsResponse>>(
  (ref) => (response) => News(
        response.author ?? '',
        response.title ?? '',
        response.description ?? '',
        response.url ?? '',
        response.urlToImage ?? '',
        response.publishedAt ?? '',
        response.content ?? '',
        ref.watch(sourceEntityMapperProvider)(response.source),
      ),
);
