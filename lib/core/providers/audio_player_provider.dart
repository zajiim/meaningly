import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:audioplayers/audioplayers.dart';

part 'audio_player_provider.g.dart';

@riverpod
AudioPlayer audioPlayerInstance(Ref ref) {
  final player = AudioPlayer();
  ref.onDispose(() => player.dispose());
  return player;
}

@riverpod
class AudioPlayerNotifier extends _$AudioPlayerNotifier {
  @override
  void build() {}

  Future<void> play(String url) async {
    if (url.isEmpty) return;
    try {
      final player = ref.read(audioPlayerInstanceProvider);
      await player.stop();
      await player.play(UrlSource(url));
    } catch (e) {
      debugPrint('Error playing audio: $e====> $url');
    }
  }
}