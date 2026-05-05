import 'package:flutter/material.dart';
import 'package:meaningly/features/main/settings/presentation/widgets/settings_item.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SettingsItem(
              icon: Icons.shopping_bag_outlined,
              title: "Night mode",
              onTap: () {},
            ),
          ]
        ),
      ),
    );
  }
}
