import '../repositories/onboarding_repository.dart';

class CheckOnboardingStatusUseCase {
  final OnboardingRepository repository;

  CheckOnboardingStatusUseCase(this.repository);

  bool execute() {
    return repository.hasCompletedOnboarding();
  }
}
