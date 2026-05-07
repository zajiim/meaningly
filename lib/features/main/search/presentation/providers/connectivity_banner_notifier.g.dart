// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connectivity_banner_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ConnectivityBannerNotifier)
final connectivityBannerProvider = ConnectivityBannerNotifierProvider._();

final class ConnectivityBannerNotifierProvider
    extends $NotifierProvider<ConnectivityBannerNotifier, BannerState> {
  ConnectivityBannerNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'connectivityBannerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$connectivityBannerNotifierHash();

  @$internal
  @override
  ConnectivityBannerNotifier create() => ConnectivityBannerNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(BannerState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<BannerState>(value),
    );
  }
}

String _$connectivityBannerNotifierHash() =>
    r'afa018eed73bc11315ceba48dafa4a7c60ab393a';

abstract class _$ConnectivityBannerNotifier extends $Notifier<BannerState> {
  BannerState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<BannerState, BannerState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<BannerState, BannerState>,
              BannerState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
