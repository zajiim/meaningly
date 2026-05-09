// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collections_di_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(offlineWords)
final offlineWordsProvider = OfflineWordsFamily._();

final class OfflineWordsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<MapEntry<String, String>>>,
          List<MapEntry<String, String>>,
          FutureOr<List<MapEntry<String, String>>>
        >
    with
        $FutureModifier<List<MapEntry<String, String>>>,
        $FutureProvider<List<MapEntry<String, String>>> {
  OfflineWordsProvider._({
    required OfflineWordsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'offlineWordsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$offlineWordsHash();

  @override
  String toString() {
    return r'offlineWordsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<MapEntry<String, String>>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<MapEntry<String, String>>> create(Ref ref) {
    final argument = this.argument as String;
    return offlineWords(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is OfflineWordsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$offlineWordsHash() => r'a8bc1efd6701c450ec6f2ed54dd3168641a1d32b';

final class OfflineWordsFamily extends $Family
    with
        $FunctionalFamilyOverride<
          FutureOr<List<MapEntry<String, String>>>,
          String
        > {
  OfflineWordsFamily._()
    : super(
        retry: null,
        name: r'offlineWordsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  OfflineWordsProvider call(String query) =>
      OfflineWordsProvider._(argument: query, from: this);

  @override
  String toString() => r'offlineWordsProvider';
}
