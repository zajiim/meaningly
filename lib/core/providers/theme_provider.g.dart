// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ThemeProvider)
final themeProviderProvider = ThemeProviderProvider._();

final class ThemeProviderProvider
    extends $NotifierProvider<ThemeProvider, ThemeMode> {
  ThemeProviderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'themeProviderProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$themeProviderHash();

  @$internal
  @override
  ThemeProvider create() => ThemeProvider();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeMode>(value),
    );
  }
}

String _$themeProviderHash() => r'227fb6a580da8f3019b863d5d120d0a7b1a2cc1f';

abstract class _$ThemeProvider extends $Notifier<ThemeMode> {
  ThemeMode build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ThemeMode, ThemeMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ThemeMode, ThemeMode>,
              ThemeMode,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
