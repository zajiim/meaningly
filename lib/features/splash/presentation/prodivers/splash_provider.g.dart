// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SplashInitialization)
final splashInitializationProvider = SplashInitializationProvider._();

final class SplashInitializationProvider
    extends $AsyncNotifierProvider<SplashInitialization, SplashStatus> {
  SplashInitializationProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'splashInitializationProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$splashInitializationHash();

  @$internal
  @override
  SplashInitialization create() => SplashInitialization();
}

String _$splashInitializationHash() =>
    r'ddaaa3333029cdb3040fab2478b8cba8de3c721d';

abstract class _$SplashInitialization extends $AsyncNotifier<SplashStatus> {
  FutureOr<SplashStatus> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<SplashStatus>, SplashStatus>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<SplashStatus>, SplashStatus>,
              AsyncValue<SplashStatus>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
