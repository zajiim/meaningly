import 'package:audioplayers/audioplayers.dart';
import 'package:meaningly/core/providers/audio_player_provider.dart';
import 'package:meaningly/features/main/details/presentation/word_detail_states.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'word_detail_notifier.g.dart';

@riverpod
class WordDetailNotifier extends _$WordDetailNotifier {
  @override
  WordDetailStates build(String initialPartOfSpeech) {
    return WordDetailData(selectedPartOfSpeech: initialPartOfSpeech);
  }

  void updateSelectedPartOfSpeech(String partOfSpeech) {
    final currentState = state;
    if(currentState is WordDetailData) {
      state = currentState.copyWith(selectedPartOfSpeech: partOfSpeech);
    }
  }

  Future<void> playAudio(String url) async {
    final currentState = state;
    if(currentState is WordDetailData) {
      state = currentState.copyWith(isPlaying: true);
      try {
        await ref.read(audioPlayerProvider.notifier).play(url);
      } finally {
        state = currentState.copyWith(isPlaying: false);
      }
    }
  }
}