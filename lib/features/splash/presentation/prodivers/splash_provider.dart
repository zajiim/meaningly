import 'package:flutter/cupertino.dart';
import 'package:meaningly/features/splash/di/splash_di_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_provider.g.dart';

enum SplashStatus { loading, loaded, error }

@riverpod
class SplashInitialization extends _$SplashInitialization {
  @override
  FutureOr<SplashStatus> build() async {
    return _initialize();
  }

  Future<SplashStatus> _initialize() async {
    try {
      debugPrint("Splash initialization started");
      final minDurationFuture = Future.delayed(const Duration(seconds: 2));
      final loadFuture = ref.read(splashDictionaryProvider.future);
      debugPrint("waiting for futures");
      await Future.wait([minDurationFuture, loadFuture]);
      debugPrint("loadFuture completed");
      return SplashStatus.loaded;
    } catch (e) {
      debugPrint("Splash initialization error: $e");
      return SplashStatus.error;
    }
  }
}
