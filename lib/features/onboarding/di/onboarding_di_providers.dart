
import 'package:meaningly/core/providers/shared_preferences_provider.dart';
import 'package:meaningly/features/onboarding/data/repositories/onboarding_repository_impl.dart';
import 'package:meaningly/features/onboarding/domain/usecases/complete_onboarding_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../data/data_sources/local_onboarding_data_source.dart';
import '../domain/repositories/onboarding_repository.dart';
import '../domain/usecases/check_onboarding_use_case.dart';

part 'onboarding_di_providers.g.dart';


@Riverpod(keepAlive: true)
LocalOnboardingDataSource localOnboardingDataSource(Ref ref) {
  final prefs = ref.watch(sharedPrefsProvider);
  return LocalOnboardingDataSourceImpl(prefs);
}

@Riverpod(keepAlive: true)
OnboardingRepository onboardingRepository(Ref ref) {
  final localDataSource = ref.watch(localOnboardingDataSourceProvider);
  return OnboardingRepositoryImpl(localDataSource);
}

@Riverpod(keepAlive: true)
CompleteOnboardingUseCase completeOnboardingUseCase(Ref ref) {
  final repository = ref.watch(onboardingRepositoryProvider);
  return CompleteOnboardingUseCase(repository);
}

@Riverpod(keepAlive: true)
CheckOnboardingStatusUseCase checkOnboardingStatusUseCase(Ref ref) {
  final repository = ref.watch(onboardingRepositoryProvider);
  return CheckOnboardingStatusUseCase(repository);
}
