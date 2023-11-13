import 'package:dio/dio.dart';
import 'package:flutter_loggy_dio/flutter_loggy_dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:news_app/common/app_constants.dart';
import 'package:news_app/common/data/api_client.dart';
import 'package:news_app/features/home/domain/entities/news.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final apiClientProvider = Provider<ApiClient>(
  (ref) => ApiClient(
    ref.watch(
      dioProvider(AppConstants.baseUrl),
    ),
  ),
);

final dioProvider = Provider.family<Dio, String>(
  (ref, baseUrl) => Dio(
    BaseOptions(baseUrl: baseUrl),
  )..interceptors.addAll(
      [
        LoggyDioInterceptor(requestBody: true, requestHeader: true),
        PrettyDioLogger(requestHeader: true, requestBody: true)
      ],
    ),
);

final newsBoxProvider = Provider<Box<News>>(
  (ref) => Hive.box<News>('news'),
);
