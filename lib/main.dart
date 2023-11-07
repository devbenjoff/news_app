import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news_app/common/presentation/widgets/base_widget.dart';
import 'package:news_app/common/router/router.dart';
import 'package:news_app/observers.dart';
import 'package:news_app/theme/app_theme.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [
        Observers(),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      routerConfig: ref.read(routerProvider),
      title: 'News App',
      darkTheme: newsAppDarkTheme,
      theme: newsAppLightTheme,
      themeMode: ThemeMode.system,
      builder: (context, child) => BaseWidget(
        child: child ?? const SizedBox(),
      ),
    );
  }
}
