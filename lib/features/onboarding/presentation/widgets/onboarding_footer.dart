import 'package:flutter/material.dart';

class OnboardingFooter extends StatelessWidget {
  final VoidCallback onNext;
  final VoidCallback onPrev;
  final VoidCallback onGetStarted;

  const OnboardingFooter({
    super.key,
    required this.onNext,
    required this.onPrev,
    required this.onGetStarted,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(onPressed: onPrev, child: const Text("Previous")),
        Spacer(),
        TextButton(onPressed: onGetStarted, child: const Text("Get Started")),
      ],
    );
  }
}
