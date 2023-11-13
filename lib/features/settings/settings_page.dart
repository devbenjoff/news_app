import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/common/domain/providers/app_theme_provider.dart';
import 'package:news_app/common/utils/context_extension.dart';

class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentTheme = ref.watch(appThemeProvider) == ThemeMode.dark;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Settings Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dark theme', style: context.textTheme.titleMedium),
                Switch(
                  value: currentTheme,
                  onChanged: (value) =>
                      ref.read(appThemeProvider.notifier).switchTheme(value),
                  activeColor: context.colorScheme.tertiary,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
