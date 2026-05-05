sealed class WordDetailStates {
  const WordDetailStates();
}

class WordDetailData extends WordDetailStates {
  final String selectedPartOfSpeech;

  const WordDetailData({
    required this.selectedPartOfSpeech,
  });

  WordDetailData copyWith({
    String? selectedPartOfSpeech,
  }) {
    return WordDetailData(
      selectedPartOfSpeech: selectedPartOfSpeech ?? this.selectedPartOfSpeech,
    );
  }
}