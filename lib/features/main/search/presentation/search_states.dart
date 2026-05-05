import '../domain/entities/dictionary_word_entity.dart';

sealed class SearchStates {
  const SearchStates();
}

class SearchInitial extends SearchStates {
  final List<String> history;
  const SearchInitial({this.history = const []});
}

class SearchLoading extends SearchStates {
  const SearchLoading();
}

class SearchLoaded extends SearchStates {
  final List<DictionaryWordEntity> results;
  const SearchLoaded(this.results);
}

class SearchError extends SearchStates {
  final String message;
  const SearchError(this.message);
}
