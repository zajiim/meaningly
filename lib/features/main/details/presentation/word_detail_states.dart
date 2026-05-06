sealed class WordDetailStates {
  const WordDetailStates();
}

class WordDetailData extends WordDetailStates {
  final String selectedPartOfSpeech;
  final bool isPlaying;
  final bool isBookmarked;

  const WordDetailData({
    required this.selectedPartOfSpeech, this.isPlaying = false, this.isBookmarked = false
  });

  WordDetailData copyWith({
    String? selectedPartOfSpeech,
    bool? isPlaying,
    bool? isBookmarked
  }) {
    return WordDetailData(
      selectedPartOfSpeech: selectedPartOfSpeech ?? this.selectedPartOfSpeech,
      isPlaying: isPlaying ?? this.isPlaying,
      isBookmarked: isBookmarked ?? this.isBookmarked,
    );
  }
}