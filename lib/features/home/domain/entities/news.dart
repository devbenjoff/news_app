import 'package:hive/hive.dart';
import 'package:news_app/features/home/domain/entities/source.dart';

part 'news.g.dart';

@HiveType(typeId: 0)
class News {
  @HiveField(0)
  final String author;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String description;
  @HiveField(3)
  final String url;
  @HiveField(4)
  final String urlToImage;
  @HiveField(5)
  final String publishedAt;
  @HiveField(6)
  final String content;
  @HiveField(7)
  final Source source;

  News(
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
    this.source,
  );
}
