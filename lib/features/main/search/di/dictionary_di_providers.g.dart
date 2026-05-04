// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dictionary_di_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(chopperClient)
final chopperClientProvider = ChopperClientProvider._();

final class ChopperClientProvider
    extends $FunctionalProvider<ChopperClient, ChopperClient, ChopperClient>
    with $Provider<ChopperClient> {
  ChopperClientProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chopperClientProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chopperClientHash();

  @$internal
  @override
  $ProviderElement<ChopperClient> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ChopperClient create(Ref ref) {
    return chopperClient(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChopperClient value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChopperClient>(value),
    );
  }
}

String _$chopperClientHash() => r'b097a7942921bdb12cde44c73dde9d8a7836aa4a';

@ProviderFor(dictionaryApiService)
final dictionaryApiServiceProvider = DictionaryApiServiceProvider._();

final class DictionaryApiServiceProvider
    extends
        $FunctionalProvider<
          DictionaryApiService,
          DictionaryApiService,
          DictionaryApiService
        >
    with $Provider<DictionaryApiService> {
  DictionaryApiServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dictionaryApiServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dictionaryApiServiceHash();

  @$internal
  @override
  $ProviderElement<DictionaryApiService> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DictionaryApiService create(Ref ref) {
    return dictionaryApiService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DictionaryApiService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DictionaryApiService>(value),
    );
  }
}

String _$dictionaryApiServiceHash() =>
    r'4cdbb00fdc2d5cd90ab98404b8bb4bce4009f328';

@ProviderFor(dictionaryRepository)
final dictionaryRepositoryProvider = DictionaryRepositoryProvider._();

final class DictionaryRepositoryProvider
    extends
        $FunctionalProvider<
          DictionaryRepository,
          DictionaryRepository,
          DictionaryRepository
        >
    with $Provider<DictionaryRepository> {
  DictionaryRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'dictionaryRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$dictionaryRepositoryHash();

  @$internal
  @override
  $ProviderElement<DictionaryRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DictionaryRepository create(Ref ref) {
    return dictionaryRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DictionaryRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DictionaryRepository>(value),
    );
  }
}

String _$dictionaryRepositoryHash() =>
    r'1f534e0bdcf97ed282c5f175e7cfb057cde330af';

@ProviderFor(searchWordsUseCase)
final searchWordsUseCaseProvider = SearchWordsUseCaseProvider._();

final class SearchWordsUseCaseProvider
    extends
        $FunctionalProvider<
          SearchWordsUseCase,
          SearchWordsUseCase,
          SearchWordsUseCase
        >
    with $Provider<SearchWordsUseCase> {
  SearchWordsUseCaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchWordsUseCaseProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchWordsUseCaseHash();

  @$internal
  @override
  $ProviderElement<SearchWordsUseCase> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  SearchWordsUseCase create(Ref ref) {
    return searchWordsUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SearchWordsUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SearchWordsUseCase>(value),
    );
  }
}

String _$searchWordsUseCaseHash() =>
    r'4b13817985328cbf1c386085ee293f7f7723fe25';
