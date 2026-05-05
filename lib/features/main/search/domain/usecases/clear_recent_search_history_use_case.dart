import 'package:meaningly/features/main/search/domain/repository/dictionary_repository.dart';

class ClearRecentSearchHistoryUseCase {
  final DictionaryRepository _repository;
  ClearRecentSearchHistoryUseCase(this._repository);

  Future<void> call() async {
    await _repository.clearRecentSearchHistory();
  }
}