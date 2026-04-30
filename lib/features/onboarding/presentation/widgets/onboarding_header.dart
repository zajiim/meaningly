import 'package:flutter/material.dart';

class OnboardingHeader extends StatelessWidget {
  final ValueNotifier<int> pageNotifier;
  final int totalPages;
  final VoidCallback onSkip;

  const OnboardingHeader({
    super.key,
    required this.pageNotifier,
    required this.totalPages,
    required this.onSkip,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: pageNotifier,
      builder: (context, pageIndex, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "${pageIndex + 1}/$totalPages",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            if (pageIndex < totalPages - 1)
              TextButton(
                onPressed: onSkip,
                child: const Text("Skip"),
              )
            else
              const SizedBox(height: 48),
          ],
        );
      },
    );
  }
}