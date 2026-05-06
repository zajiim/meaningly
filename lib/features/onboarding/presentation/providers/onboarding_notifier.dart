import 'package:meaningly/features/onboarding/di/onboarding_di_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'onboarding_notifier.g.dart';

@Riverpod(keepAlive: true)
class OnboardingNotifier extends _$OnboardingNotifier{
  @override
  bool build() {
    final checkUseCase = ref.watch(checkOnboardingStatusUseCaseProvider);
    return checkUseCase.execute();
  }

  Future<void> completeOnboarding() async {
    final completeUseCase = ref.read(completeOnboardingUseCaseProvider);
    await completeUseCase.execute();
    state = true;
  }
}