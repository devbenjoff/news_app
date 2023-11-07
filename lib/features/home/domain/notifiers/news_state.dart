import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:news_app/common/domain/entities/failure.dart';
import 'package:news_app/features/home/domain/entities/news.dart';

part 'news_state.freezed.dart';

@freezed
class NewsState with _$NewsState {
  const factory NewsState.initial() = _Initial;
  const factory NewsState.loading() = _Loading;
  const factory NewsState.data(List<News> news) = _Data;
  const factory NewsState.error(Failure failure) = _Error;
}
