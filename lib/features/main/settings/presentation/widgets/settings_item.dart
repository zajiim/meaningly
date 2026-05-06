import 'package:flutter/material.dart';

class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subTitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SettingsItem({
    super.key,
    required this.icon,
    required this.title,
    required this.subTitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Icon(icon, size: 24, color: Colors.grey.shade500),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                const SizedBox(height: 4),
                Text(
                  subTitle,
                  style: TextStyle(color: Colors.grey.shade500),
                ),
              ]
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeThumbColor: Theme.of(context).primaryColor,
            inactiveThumbColor: Colors.grey,
          ),
        ],
      ),
    );
  }
}
