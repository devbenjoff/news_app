import 'dart:core';

import 'package:news_app/features/home/data/repositories/news_repository.dart';
import 'package:news_app/features/home/domain/entities/news_list.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../common/domain/async_notifier_mixin.dart';

part 'news_notifier.g.dart';

@riverpod
class AsyncNewsList extends _$AsyncNewsList with AsyncNotifierMixin {
  @override
  FutureOr<NewsList> build() => executeBuildWithGlobalFailure(
        () => ref.read(newsRepositoryProvider).getNews(),
        ref,
      );
}
