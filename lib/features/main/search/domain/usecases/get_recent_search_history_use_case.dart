import 'package:fpdart/fpdart.dart';
import 'package:meaningly/core/error/failure.dart';
import 'package:meaningly/features/main/search/domain/repository/dictionary_repository.dart';

class GetRecentSearchHistoryUseCase {
  final DictionaryRepository _repository;

  GetRecentSearchHistoryUseCase(this._repository);

  Future<Either<Failure, List<String>>> call() async {
    return await _repository.getRecentSearchHistory();
  }
}