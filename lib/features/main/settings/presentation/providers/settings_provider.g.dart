// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SettingsProvider)
final settingsProviderProvider = SettingsProviderProvider._();

final class SettingsProviderProvider
    extends $NotifierProvider<SettingsProvider, SettingsStates> {
  SettingsProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'settingsProviderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$settingsProviderHash();

  @$internal
  @override
  SettingsProvider create() => SettingsProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingsStates value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingsStates>(value),
    );
  }
}

String _$settingsProviderHash() => r'b614b3926a407909e927dd3d24761ab47a291804';

abstract class _$SettingsProvider extends $Notifier<SettingsStates> {
  SettingsStates build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<SettingsStates, SettingsStates>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SettingsStates, SettingsStates>,
              SettingsStates,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
