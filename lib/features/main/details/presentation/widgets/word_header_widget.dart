import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../search/domain/entities/dictionary_word_entity.dart';

class WordHeaderWidget extends StatelessWidget {
  final DictionaryWordEntity word;
  const WordHeaderWidget({super.key, required this.word});

  @override
  Widget build(BuildContext context) {
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
                word.phonetic ?? word.phonetics?.firstWhere((p) => p.text != null).text ?? '',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            IconButton(
              icon: Icon(CupertinoIcons.volume_up, color: Theme.of(context).primaryColor, size: 28),
              onPressed: () {
              },
            ),
          ],
        ),
      ],
    );
  }
}