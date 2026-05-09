import 'package:meaningly/core/providers/audio_player_provider.dart';
import 'package:meaningly/features/main/bookmarks/presentation/providers/bookmark_notifier.dart';
import 'package:meaningly/features/main/details/presentation/word_detail_states.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../search/domain/entities/dictionary_word_entity.dart';

part 'word_detail_notifier.g.dart';

@riverpod
class WordDetailNotifier extends _$WordDetailNotifier {
  @override
  Future<WordDetailStates> build(String word, String initialPartOfSpeech) async {
    final isBookmarked = await ref.watch(isWordBookmarkedProvider(word).future);
    return WordDetailData(
      isBookmarked: isBookmarked, selectedPartOfSpeech: initialPartOfSpeech);
  }

  void updateSelectedPartOfSpeech(String partOfSpeech) {
    final currentState = state.value;
    if(currentState is WordDetailData) {
      // state = currentState.copyWith(selectedPartOfSpeech: partOfSpeech);
      state = AsyncData(currentState.copyWith(selectedPartOfSpeech: partOfSpeech));
    }
  }

  Future<void> toggleBookmark(DictionaryWordEntity wordEntity) async {
    await ref.read(bookmarkProvider.notifier).toggleBookmark(wordEntity);
  }

  Future<void> playAudio(String url) async {
    final currentState = state.value;
    if(currentState is WordDetailData) {
      state = AsyncData(currentState.copyWith(isPlaying: true));
      try {
        await ref.read(audioPlayerProvider.notifier).play(url);
      } finally {
        state = AsyncData(currentState.copyWith(isPlaying: false));
      }
    }
  }


}