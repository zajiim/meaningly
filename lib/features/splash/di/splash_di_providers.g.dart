// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_di_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(splashLocalDataSource)
final splashLocalDataSourceProvider = SplashLocalDataSourceProvider._();

final class SplashLocalDataSourceProvider
    extends
        $FunctionalProvider<
          SplashDataSource,
          SplashDataSource,
          SplashDataSource
        >
    with $Provider<SplashDataSource> {
  SplashLocalDataSourceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'splashLocalDataSourceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$splashLocalDataSourceHash();

  @$internal
  @override
  $ProviderElement<SplashDataSource> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SplashDataSource create(Ref ref) {
    return splashLocalDataSource(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SplashDataSource value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SplashDataSource>(value),
    );
  }
}

String _$splashLocalDataSourceHash() =>
    r'aba14035e313444d90c59f23dc978a46826fb92e';

@ProviderFor(splashRepository)
final splashRepositoryProvider = SplashRepositoryProvider._();

final class SplashRepositoryProvider
    extends
        $FunctionalProvider<
          SplashRepository,
          SplashRepository,
          SplashRepository
        >
    with $Provider<SplashRepository> {
  SplashRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'splashRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$splashRepositoryHash();

  @$internal
  @override
  $ProviderElement<SplashRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SplashRepository create(Ref ref) {
    return splashRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SplashRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SplashRepository>(value),
    );
  }
}

String _$splashRepositoryHash() => r'e46ceb00368748961f2a5bc57dc5a62f3b0c6b03';

@ProviderFor(loadDictionaryUseCase)
final loadDictionaryUseCaseProvider = LoadDictionaryUseCaseProvider._();

final class LoadDictionaryUseCaseProvider
    extends
        $FunctionalProvider<
          LoadDictionaryUseCase,
          LoadDictionaryUseCase,
          LoadDictionaryUseCase
        >
    with $Provider<LoadDictionaryUseCase> {
  LoadDictionaryUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'loadDictionaryUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$loadDictionaryUseCaseHash();

  @$internal
  @override
  $ProviderElement<LoadDictionaryUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  LoadDictionaryUseCase create(Ref ref) {
    return loadDictionaryUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LoadDictionaryUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LoadDictionaryUseCase>(value),
    );
  }
}

String _$loadDictionaryUseCaseHash() =>
    r'233c5832f701906af41b76ab85db253df28da5b1';

@ProviderFor(SplashDictionary)
final splashDictionaryProvider = SplashDictionaryProvider._();

final class SplashDictionaryProvider
    extends $AsyncNotifierProvider<SplashDictionary, void> {
  SplashDictionaryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'splashDictionaryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$splashDictionaryHash();

  @$internal
  @override
  SplashDictionary create() => SplashDictionary();
}

String _$splashDictionaryHash() => r'da9ae182955812f370ee571f5a11472837025041';

abstract class _$SplashDictionary extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
