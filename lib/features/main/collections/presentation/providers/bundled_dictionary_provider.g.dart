// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bundled_dictionary_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(bundledDictionary)
final bundledDictionaryProvider = BundledDictionaryProvider._();

final class BundledDictionaryProvider
    extends
        $FunctionalProvider<
          AsyncValue<Map<String, String>>,
          Map<String, String>,
          FutureOr<Map<String, String>>
        >
    with
        $FutureModifier<Map<String, String>>,
        $FutureProvider<Map<String, String>> {
  BundledDictionaryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'bundledDictionaryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$bundledDictionaryHash();

  @$internal
  @override
  $FutureProviderElement<Map<String, String>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<Map<String, String>> create(Ref ref) {
    return bundledDictionary(ref);
  }
}

String _$bundledDictionaryHash() => r'57fafc264bd41202dd2c1d25b47e1ceb6c8e5bb0';
