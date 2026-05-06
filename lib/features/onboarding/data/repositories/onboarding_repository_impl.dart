import 'package:meaningly/features/onboarding/data/data_sources/local_onboarding_data_source.dart';
import 'package:meaningly/features/onboarding/domain/repositories/onboarding_repository.dart';

class OnboardingRepositoryImpl implements OnboardingRepository{
  final LocalOnboardingDataSource _localOnboardingDataSource;
  OnboardingRepositoryImpl(this._localOnboardingDataSource);
  @override
  Future<void> completeOnboarding() async {
    await _localOnboardingDataSource.setOnboardingCompleted(true);
  }

  @override
  bool hasCompletedOnboarding() {
    return _localOnboardingDataSource.getOnboardingCompleted();
  }
}