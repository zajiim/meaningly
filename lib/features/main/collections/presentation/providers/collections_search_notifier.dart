import 'package:meaningly/features/main/collections/presentation/collections_states.dart';
import 'package:meaningly/features/splash/di/splash_di_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';


part 'collections_search_notifier.g.dart';

@riverpod
class CollectionsSearchNotifier extends _$CollectionsSearchNotifier {
  @override
  CollectionsStates build() {
    return CollectionSearchInitial();
  }

  Future<void> getSuggestions(String query) async {
    if (query.trim().isEmpty) {
      state =  CollectionSearchInitial();
      return;
    }

    final dictionary = await ref.read(splashDictionaryProvider.future);
    final lowercaseQuery = query.toLowerCase();

    final suggestions = dictionary.keys
        .where((key) => key.startsWith(lowercaseQuery))
        .take(20)
        .toList();

    state = CollectionsSuggestionsLoaded(suggestions, query: query);
  }

  void search(String query) {
    if (query.trim().isEmpty) {
      state =  CollectionSearchInitial();
      return;
    }
    // Set query so the screen filters the dictionary list
    state = CollectionSearchInitial(query: query.toLowerCase());
  }

  void clear() {
    state =  CollectionSearchInitial();
  }
}
