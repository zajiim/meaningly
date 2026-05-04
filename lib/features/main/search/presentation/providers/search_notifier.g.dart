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

String _$searchNotifierHash() => r'c6dc6dcb3d584ff644f17d996015e21891ff86ab';

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
