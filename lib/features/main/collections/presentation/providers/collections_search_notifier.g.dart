// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collections_search_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CollectionsSearchNotifier)
final collectionsSearchProvider = CollectionsSearchNotifierProvider._();

final class CollectionsSearchNotifierProvider
    extends $NotifierProvider<CollectionsSearchNotifier, CollectionsStates> {
  CollectionsSearchNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'collectionsSearchProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$collectionsSearchNotifierHash();

  @$internal
  @override
  CollectionsSearchNotifier create() => CollectionsSearchNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CollectionsStates value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CollectionsStates>(value),
    );
  }
}

String _$collectionsSearchNotifierHash() =>
    r'8cab53d7acf95e9dfd1b8f95c807241314231a9f';

abstract class _$CollectionsSearchNotifier
    extends $Notifier<CollectionsStates> {
  CollectionsStates build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<CollectionsStates, CollectionsStates>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<CollectionsStates, CollectionsStates>,
              CollectionsStates,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
