import 'package:dio/dio.dart';
import 'package:news_app/common/app_constants.dart';
import 'package:news_app/features/home/data/models/news_list_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET('top-headlines')
  Future<NewsListResponse> getNews({
    @Query('apiKey') String apiKey = AppConstants.apiKey,
    @Query('country') String country = 'us',
  });
}
