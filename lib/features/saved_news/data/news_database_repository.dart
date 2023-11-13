import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/common/data/providers.dart';
import 'package:news_app/features/home/domain/entities/news.dart';

final newsDatabaseRepositoryProvider = Provider<NewsDatabaseRepository>(
  (ref) => NewsDatabaseRepositoryImpl(
    ref.watch(newsBoxProvider),
  ),
);

abstract class NewsDatabaseRepository {
  List<News> getAllNews();
  void saveNews(News news);
  void deleteNews(News news);
  void deleteAllNews();
}

class NewsDatabaseRepositoryImpl implements NewsDatabaseRepository {
  final Box<News> _newsBox;

  NewsDatabaseRepositoryImpl(this._newsBox);

  @override
  List<News> getAllNews() => _newsBox.values.toList();

  @override
  void saveNews(News news) {
    if (_newsSaved(news)) return;

    _newsBox.add(news);
  }

  @override
  void deleteNews(News news) {
    _newsBox.deleteAt(_indexOfNews(news));
  }

  @override
  void deleteAllNews() {
    _newsBox.clear();
  }

  int _indexOfNews(News news) => _newsBox.values.toList().indexOf(news);

  bool _newsSaved(News news) => _newsBox.values
      .where((element) => element.title == news.title)
      .isNotEmpty;
}
