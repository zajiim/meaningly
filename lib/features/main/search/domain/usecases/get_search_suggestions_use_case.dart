import 'package:fpdart/fpdart.dart';

import '../../../../../core/error/failure.dart';
import '../repository/dictionary_repository.dart';

class GetSearchSuggestionsUseCase {
  final DictionaryRepository repository;

  GetSearchSuggestionsUseCase(this.repository);

  Future<Either<Failure, List<String>>> call(String query) async {
    return await repository.getSearchSuggestions(query);
  }
}