import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meaningly/features/onboarding/presentation/providers/onboarding_notifier.dart';
import 'package:meaningly/features/splash/presentation/prodivers/splash_provider.dart';

class SplashScreen extends ConsumerWidget {
  final void Function(bool hasCompletedOnboarding) onComplete;
  const SplashScreen({super.key, required this.onComplete});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(splashInitializationProvider, (prev, next) {
      if (next is AsyncData && next.value == SplashStatus.loaded) {
        final hasCompletedOnboarding = ref.read(onboardingProvider);
        onComplete(hasCompletedOnboarding);
      }
    });

    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.onSurface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                'assets/images/meaningly_icon.png',
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Meaningly',
              style: theme.textTheme.headlineSmall?.copyWith(
                color: theme.colorScheme.primary,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              'Your Personal Dictionary',
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.primary.withValues(alpha: 0.6),
                letterSpacing: 0.2,
              ),
            ),
            const SizedBox(height: 48),
            CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
