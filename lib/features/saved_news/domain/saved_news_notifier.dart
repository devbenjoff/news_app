import 'package:news_app/features/home/domain/entities/news.dart';
import 'package:news_app/features/saved_news/data/news_database_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'saved_news_notifier.g.dart';

@riverpod
class AsyncSavedNews extends _$AsyncSavedNews {
  @override
  List<News> build() => ref.read(newsDatabaseRepositoryProvider).getAllNews();

  void addNews(News news) {
    ref.read(newsDatabaseRepositoryProvider).saveNews(news);

    state = ref.read(newsDatabaseRepositoryProvider).getAllNews();
  }

  void deleteNews(News news) {
    ref.read(newsDatabaseRepositoryProvider).deleteNews(news);

    state = ref.read(newsDatabaseRepositoryProvider).getAllNews();
  }
}
