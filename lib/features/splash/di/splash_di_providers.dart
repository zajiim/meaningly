import 'package:meaningly/core/providers/shared_preferences_provider.dart';
import 'package:meaningly/features/main/search/di/dictionary_di_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/datasources/local/splash_data_source.dart';
import '../data/repositories/splash_repository_impl.dart';
import '../domain/repositories/splash_repository.dart';
import '../domain/usecases/load_dictionary_use_case.dart';


part 'splash_di_providers.g.dart';

@Riverpod(keepAlive: true)
SplashDataSource splashLocalDataSource(Ref ref) {
  return SplashDataSourceImpl();
}

@Riverpod(keepAlive: true)
SplashRepository splashRepository(Ref ref) {
  final dataSource = ref.watch(splashLocalDataSourceProvider);
  final localDict = ref.watch(localDictionaryDataSourceProvider);
  final prefs = ref.watch(sharedPrefsProvider);
  return SplashRepositoryImpl(dataSource, localDict, prefs);
}

@Riverpod(keepAlive: true)
LoadDictionaryUseCase loadDictionaryUseCase(Ref ref) {
  final repository = ref.watch(splashRepositoryProvider);
  return LoadDictionaryUseCase(repository);
}

@Riverpod(keepAlive: true)
class SplashDictionary extends _$SplashDictionary {
  @override
  FutureOr<void> build() async {
    final useCase = ref.watch(loadDictionaryUseCaseProvider);
    return await useCase();
  }
}
