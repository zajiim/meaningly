// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SearchNotifier)
final searchProvider = SearchNotifierProvider._();

final class SearchNotifierProvider
    extends $NotifierProvider<SearchNotifier, SearchStates> {
  SearchNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchNotifierHash();

  @$internal
  @override
  SearchNotifier create() => SearchNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SearchStates value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SearchStates>(value),
    );
  }
}

String _$searchNotifierHash() => r'bd7cd53838b0793c9c3b9cd7006c501b2f94a09a';

abstract class _$SearchNotifier extends $Notifier<SearchStates> {
  SearchStates build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<SearchStates, SearchStates>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SearchStates, SearchStates>,
              SearchStates,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
