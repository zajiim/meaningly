import 'package:flutter/material.dart';
import 'package:meaningly/core/constants/app_constants.dart';
import 'package:meaningly/core/providers/shared_preferences_provider.dart';
import 'package:meaningly/core/providers/theme_provider.dart';
import 'package:meaningly/features/main/settings/presentation/settings_states.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'settings_provider.g.dart';


@riverpod
class SettingsProvider extends _$SettingsProvider {
  @override
  SettingsStates build() {
    return SettingsInitial();
  }

  Future<void> toggleTheme(bool isDark) async {
    state = SettingsLoading();
    try {
      final prefs = ref.read(sharedPrefsProvider);
      await prefs.setString(themeValue, isDark ? 'dark' : 'light');
      ref.invalidate(themeProviderProvider);
      if (!ref.mounted) return;
      state = SettingsSuccess();
    } catch (e) {
      if (!ref.mounted) return;
      state = SettingsError(e.toString());
    }
  }
}