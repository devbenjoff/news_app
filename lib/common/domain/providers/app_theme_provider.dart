import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appThemeProvider = NotifierProvider<AppTheme, ThemeMode>(
  () => AppTheme(),
);

class AppTheme extends Notifier<ThemeMode> {
  @override
  ThemeMode build() => ThemeMode.dark;

  void switchTheme(bool isDark) =>
      state = isDark ? ThemeMode.dark : ThemeMode.light;
}
