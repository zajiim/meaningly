import '../domain/entities/dictionary_word_entity.dart';

sealed class SearchStates {
  final String query;

  const SearchStates({this.query = ''});
}

class SearchInitial extends SearchStates {
  final List<String> history;

  const SearchInitial({this.history = const [], super.query});
}

class SearchLoading extends SearchStates {
  const SearchLoading({required super.query});
}

class SearchSuggestionsLoaded extends SearchStates {
  final List<String> suggestions;

  const SearchSuggestionsLoaded(this.suggestions, {required super.query});
}

class SearchLoaded extends SearchStates {
  final List<DictionaryWordEntity> results;

  const SearchLoaded(this.results, {required super.query});
}

class SearchError extends SearchStates {
  final String message;

  const SearchError(this.message, {required super.query});
}
