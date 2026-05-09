import '../repositories/splash_repository.dart';

class LoadDictionaryUseCase {
  final SplashRepository repository;

  LoadDictionaryUseCase(this.repository);

  Future<void> call() async {
    return await repository.loadDictionary();
  }
}
