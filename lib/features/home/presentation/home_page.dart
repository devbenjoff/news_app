import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/features/home/domain/notifiers/news_notifier.dart';

import 'widgets/news_container.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsState = ref.watch(newsNotifierProvider);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Breaking News',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(height: 20),
              newsState.maybeWhen(
                orElse: () => const SizedBox(),
                loading: () => const LinearProgressIndicator(),
                data: (news) => Expanded(
                  child: ListView.separated(
                    itemCount: news.length,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        NewsContainer(news: news[index]),
                    separatorBuilder: (_, __) => const SizedBox(height: 8),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
