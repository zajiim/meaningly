sealed class CollectionsStates {
  final String query;

  CollectionsStates({this.query = ''});
}

class CollectionSearchInitial extends CollectionsStates {
   CollectionSearchInitial({super.query});
}

class CollectionsSuggestionsLoaded extends CollectionsStates {
  final List<String> suggestions;

   CollectionsSuggestionsLoaded(this.suggestions, {required super.query});
}
