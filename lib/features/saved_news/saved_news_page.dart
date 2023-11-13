import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/common/utils/context_extension.dart';
import 'package:news_app/features/home/presentation/widgets/news_container.dart';
import 'package:news_app/features/saved_news/domain/saved_news_notifier.dart';

class SavedNewsPage extends ConsumerWidget {
  const SavedNewsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final savedNews = ref.watch(asyncSavedNewsProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Saved News',
                style: context.textTheme.headlineLarge,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView(
                  children: [
                    for (final news in savedNews)
                      Column(
                        children: [
                          NewsContainer(news: news, saved: true),
                          const SizedBox(height: 8)
                        ],
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
