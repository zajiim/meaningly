import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../search/domain/entities/dictionary_word_entity.dart';

class WordHeaderWidget extends StatelessWidget {
  final DictionaryWordEntity word;
  final VoidCallback? onPlay;
  final bool isPlaying;

  const WordHeaderWidget({
    super.key,
    required this.word,
    this.onPlay,
    required this.isPlaying,
  });

  @override
  Widget build(BuildContext context) {
    // String? audioUrl = word.phonetics
    //     ?.firstWhere((p) => p.audio!.isNotEmpty, orElse: () => const Phonetic())
    //     .audio;
    String? audioUrl = word.phonetics
        ?.firstWhere(
          (p) => p.audio != null && p.audio!.isNotEmpty,
          orElse: () => const Phonetic(),
        )
        .audio;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          word.word ?? '',
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodyLarge?.color,
            fontFamily: 'Serif',
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: Text(
                // word.phonetic ??
                //     word.phonetics?.firstWhere((p) => p.text != null).text ??
                //     '',
                word.phonetics
                        ?.firstWhere(
                          (p) => p.text != null,
                          orElse: () => const Phonetic(),
                        )
                        .text ??
                    '',

                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            if (audioUrl != null && audioUrl.isNotEmpty)
              IconButton(
                icon: isPlaying
                    ? const SizedBox(
                        width: 28,
                        height: 28,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : Icon(
                        CupertinoIcons.volume_up,
                        color: Theme.of(context).primaryColor,
                        size: 28,
                      ),
                onPressed: isPlaying ? null : onPlay,
              ),
          ],
        ),
      ],
    );
  }
}
