import 'package:fpdart/fpdart.dart';
import 'package:meaningly/core/error/failure.dart';
import 'package:meaningly/features/main/search/domain/entities/dictionary_word_entity.dart';
import 'package:meaningly/features/main/search/domain/repository/dictionary_repository.dart';

class SearchWordsUseCase {
  final DictionaryRepository _repository;

  SearchWordsUseCase(this._repository);

  Future<Either<Failure, List<DictionaryWordEntity>>> call(String query) async {
    if(query.isEmpty) {
      return Left(Failure('Query cannot be empty'));
    }
    return await _repository.searchWords(query);
  }
}