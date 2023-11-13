import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/common/utils/context_extension.dart';
import 'package:news_app/features/home/domain/notifiers/news_notifier.dart';
import 'package:news_app/features/home/presentation/widgets/news_container_shimmer.dart';

import 'widgets/news_container.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final newsList = ref.watch(asyncNewsListProvider);

    return Scaffold(
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async => await ref.refresh(asyncNewsListProvider),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 20),
                Text(
                  'Breaking News',
                  style: context.textTheme.headlineLarge,
                ),
                const SizedBox(height: 20),
                switch (newsList) {
                  AsyncData(:final value) => Expanded(
                      child: ListView.separated(
                        itemCount: value.newsList.length,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) => NewsContainer(
                          news: value.newsList[index],
                        ),
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                      ),
                    ),
                  _ => Expanded(
                      child: ListView.separated(
                        itemCount: 5,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) =>
                            const NewsContainerShimmer(),
                        separatorBuilder: (_, __) => const SizedBox(height: 8),
                      ),
                    ),
                }
              ],
            ),
          ),
        ),
      ),
    );
  }
}
