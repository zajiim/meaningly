import 'package:flutter/material.dart';
import 'package:meaningly/features/main/settings/presentation/widgets/settings_item.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
          // SettingsItem(icon: Icons.dark_mode, title: "Night mode", subTitle: "Switches to darker colors", value: value, onChanged: onChanged)
        ],
      ),
    );
  }
}
