import 'package:flutter/cupertino.dart';
import 'package:meaningly/features/main/search/di/dictionary_di_providers.dart';
import 'package:meaningly/features/main/search/presentation/search_states.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_notifier.g.dart';

@riverpod
class SearchNotifier extends _$SearchNotifier {
  @override
  SearchStates build() {
    _loadHistory();
    return const SearchInitial();
  }

  Future<void> _loadHistory() async {
    final useCase = ref.read(getRecentSearchHistoryUseCaseProvider);
    final result = await useCase();
    result.fold((failure) => null, (history) {
      // if (state is SearchInitial) {
      state = SearchInitial(history: history);
      // }
    });
  }

  Future<void> getSuggestions(String query) async {
    if (query.trim().isEmpty) {
      _loadHistory();
      return;
    }

    final useCase = ref.read(getSearchSuggestionsUseCaseProvider);
    final result = await useCase(query);

    result.fold(
          (failure) {},
          (suggestions) {
        state = SearchSuggestionsLoaded(suggestions, query: query);
      },
    );

  }

  Future<void> search(String query) async {
    debugPrint('search called with: "$query"');
    if (query.trim().isEmpty) {
      // state = const SearchInitial();
      _loadHistory();
      debugPrint('search initial calles inside search"');
      return;
    }

    state = SearchLoading(query: query);
    debugPrint('search loadingg...');

    final useCase = ref.read(searchWordsUseCaseProvider);
    final result = await useCase(query);
    debugPrint('result received >>>>>: "$result"');

    result.fold(
      (failure) {
        debugPrint('failure case $failure"');
        state = SearchError(failure.message, query: query);
      },
      (results) {
        debugPrint('success case $results"');
        state = SearchLoaded(results, query: query);
      },
    );
  }

  Future<void> clearHistory() async {
    final clearHistoryUseCase = ref.read(
      clearRecentSearchHistoryUseCaseProvider,
    );
    await clearHistoryUseCase();
    state = const SearchInitial(history: []);
  }
}
