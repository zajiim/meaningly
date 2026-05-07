// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_di_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(localOnboardingDataSource)
final localOnboardingDataSourceProvider = LocalOnboardingDataSourceProvider._();

final class LocalOnboardingDataSourceProvider
    extends
        $FunctionalProvider<
          LocalOnboardingDataSource,
          LocalOnboardingDataSource,
          LocalOnboardingDataSource
        >
    with $Provider<LocalOnboardingDataSource> {
  LocalOnboardingDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'localOnboardingDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$localOnboardingDataSourceHash();

  @$internal
  @override
  $ProviderElement<LocalOnboardingDataSource> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LocalOnboardingDataSource create(Ref ref) {
    return localOnboardingDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LocalOnboardingDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LocalOnboardingDataSource>(value),
    );
  }
}

String _$localOnboardingDataSourceHash() =>
    r'2811fc5e913bc30b4d26468a339fec81e29641e6';

@ProviderFor(onboardingRepository)
final onboardingRepositoryProvider = OnboardingRepositoryProvider._();

final class OnboardingRepositoryProvider
    extends
        $FunctionalProvider<
          OnboardingRepository,
          OnboardingRepository,
          OnboardingRepository
        >
    with $Provider<OnboardingRepository> {
  OnboardingRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'onboardingRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$onboardingRepositoryHash();

  @$internal
  @override
  $ProviderElement<OnboardingRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  OnboardingRepository create(Ref ref) {
    return onboardingRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(OnboardingRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<OnboardingRepository>(value),
    );
  }
}

String _$onboardingRepositoryHash() =>
    r'ed3f73c0eeaa2340fc51f32d3ebc8733b2b4d09d';

@ProviderFor(completeOnboardingUseCase)
final completeOnboardingUseCaseProvider = CompleteOnboardingUseCaseProvider._();

final class CompleteOnboardingUseCaseProvider
    extends
        $FunctionalProvider<
          CompleteOnboardingUseCase,
          CompleteOnboardingUseCase,
          CompleteOnboardingUseCase
        >
    with $Provider<CompleteOnboardingUseCase> {
  CompleteOnboardingUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'completeOnboardingUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$completeOnboardingUseCaseHash();

  @$internal
  @override
  $ProviderElement<CompleteOnboardingUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CompleteOnboardingUseCase create(Ref ref) {
    return completeOnboardingUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CompleteOnboardingUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CompleteOnboardingUseCase>(value),
    );
  }
}

String _$completeOnboardingUseCaseHash() =>
    r'1a1268ed03698294fbe9e138fd575f4f84a22257';

@ProviderFor(checkOnboardingStatusUseCase)
final checkOnboardingStatusUseCaseProvider =
    CheckOnboardingStatusUseCaseProvider._();

final class CheckOnboardingStatusUseCaseProvider
    extends
        $FunctionalProvider<
          CheckOnboardingStatusUseCase,
          CheckOnboardingStatusUseCase,
          CheckOnboardingStatusUseCase
        >
    with $Provider<CheckOnboardingStatusUseCase> {
  CheckOnboardingStatusUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'checkOnboardingStatusUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$checkOnboardingStatusUseCaseHash();

  @$internal
  @override
  $ProviderElement<CheckOnboardingStatusUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CheckOnboardingStatusUseCase create(Ref ref) {
    return checkOnboardingStatusUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CheckOnboardingStatusUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CheckOnboardingStatusUseCase>(value),
    );
  }
}

String _$checkOnboardingStatusUseCaseHash() =>
    r'9e9c9603fb11cccfe1bbf8650f3a9b05647ff5d1';
