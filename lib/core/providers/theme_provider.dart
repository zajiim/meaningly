import 'package:flutter/material.dart';
import 'package:meaningly/core/providers/shared_preferences_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../constants/app_constants.dart';

part 'theme_provider.g.dart';

@Riverpod(keepAlive: true)
class ThemeProvider extends _$ThemeProvider{
  @override
  ThemeMode build() {
    final prefs = ref.read(sharedPrefsProvider);
    final themeString = prefs.getString(themeValue);
    return themeString == 'dark' ? ThemeMode.dark : ThemeMode.light;
  }
}