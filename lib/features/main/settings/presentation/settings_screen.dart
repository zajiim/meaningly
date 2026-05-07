import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:meaningly/core/providers/theme_provider.dart';
import 'package:meaningly/features/main/settings/presentation/providers/settings_provider.dart';
import 'package:meaningly/features/main/settings/presentation/widgets/settings_item.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(settingsProviderProvider);
    final themeMode = ref.watch(themeProviderProvider);
    final bool isDarkMode = themeMode == ThemeMode.dark;


    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          SettingsItem(
            icon: Icons.dark_mode,
            title: "Night mode",
            subTitle: "Switches to darker colors",
            value: isDarkMode,
            onChanged: (value) async {
              debugPrint(value.toString());
              await ref.read(settingsProviderProvider.notifier).toggleTheme(value);
            },
          ),
        ],
      ),
    );
  }
}
