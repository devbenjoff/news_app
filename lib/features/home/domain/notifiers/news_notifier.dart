import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/features/home/data/repositories/news_repository.dart';
import 'package:news_app/features/home/domain/notifiers/news_state.dart';

final newsNotifierProvider = StateNotifierProvider<NewsNotifier, NewsState>(
  (ref) => NewsNotifier(
    ref.watch(newsRepositoryProvider),
  )..getNews(),
);

class NewsNotifier extends StateNotifier<NewsState> {
  final NewsRepository _newsRepository;

  NewsNotifier(this._newsRepository) : super(const NewsState.initial());

  Future<void> getNews() async {
    state = const NewsState.loading();

    final result = await _newsRepository.getNews();

    state = result.fold(
      (failure) => NewsState.error(failure),
      (news) => NewsState.data(news),
    );
  }
}
