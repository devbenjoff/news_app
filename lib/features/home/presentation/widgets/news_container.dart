import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/common/utils/context_extension.dart';
import 'package:news_app/features/home/domain/entities/news.dart';
import 'package:news_app/features/saved_news/domain/saved_news_notifier.dart';

class NewsContainer extends ConsumerWidget {
  final News news;
  final bool saved;

  const NewsContainer({
    super.key,
    required this.news,
    this.saved = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: context.colorScheme.onSecondary,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100.0,
            width: 100.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              image: DecorationImage(
                image: NetworkImage(news.urlToImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  news.source.name,
                  style: context.textTheme.titleSmall?.copyWith(
                    color: context.colorScheme.onPrimary.withOpacity(0.6),
                  ),
                ),
                Text(
                  news.title,
                  style: context.textTheme.titleMedium?.copyWith(
                    color: context.colorScheme.onPrimary,
                  ),
                ),
                Text(
                  news.author,
                  style: context.textTheme.titleSmall?.copyWith(
                    color: context.colorScheme.onPrimary.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            onPressed: () {
              if (saved) {
                ref.read(asyncSavedNewsProvider.notifier).deleteNews(news);
              } else {
                ref.read(asyncSavedNewsProvider.notifier).addNews(news);
              }
            },
            icon: Icon(
              saved ? Icons.delete : Icons.bookmark_border,
              color: context.colorScheme.onPrimary,
            ),
          )
        ],
      ),
    );
  }
}
