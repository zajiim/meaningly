sealed class WordDetailStates {
  const WordDetailStates();
}

class WordDetailData extends WordDetailStates {
  final String selectedPartOfSpeech;
  final bool isPlaying;

  const WordDetailData({
    required this.selectedPartOfSpeech, this.isPlaying = false,
  });

  WordDetailData copyWith({
    String? selectedPartOfSpeech,
    bool? isPlaying
  }) {
    return WordDetailData(
      selectedPartOfSpeech: selectedPartOfSpeech ?? this.selectedPartOfSpeech,
      isPlaying: isPlaying ?? this.isPlaying,
    );
  }
}