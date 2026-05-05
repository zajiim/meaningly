import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meaningly/features/main/details/presentation/providers/word_detail_notifier.dart';
import 'package:meaningly/features/main/details/presentation/widgets/definitions_section.dart';
import 'package:meaningly/features/main/details/presentation/widgets/part_of_speech_selector.dart';
import 'package:meaningly/features/main/details/presentation/widgets/word_header_widget.dart';
import 'package:meaningly/features/main/details/presentation/word_detail_states.dart';

import '../../search/domain/entities/dictionary_word_entity.dart';

class WordDetailPage extends ConsumerWidget {
  final DictionaryWordEntity word;

  const WordDetailPage(this.word, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialPartOfSpeech = word.meanings?.first.partOfSpeech ?? '';
    final state = ref.watch(wordDetailProvider(initialPartOfSpeech));

    if (state is! WordDetailData) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final currentMeaning = word.meanings?.firstWhere(
      (m) => m.partOfSpeech == state.selectedPartOfSpeech,
      orElse: () => word.meanings!.first,
    );

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => context.pop(),
          icon: Icon(
            Icons.arrow_back_ios,
            size: 18,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  WordHeaderWidget(
                    word: word,
                    isPlaying: state.isPlaying,
                    onPlay: () {
                      final audioUrl = word.phonetics
                          ?.firstWhere(
                            (p) => p.audio != null && p.audio!.isNotEmpty,
                            orElse: () => const Phonetic(),
                          )
                          .audio;
                      if (audioUrl != null) {
                        ref
                            .read(
                              wordDetailProvider(initialPartOfSpeech).notifier,
                            )
                            .playAudio(
                          "https://api.dictionaryapi.dev/media/pronunciations/en/war-uk.mp3"
                              // audioUrl.startsWith('//')
                              //     ? 'https:$audioUrl'
                              //     : audioUrl,
                            );
                      }
                    },
                  ),
                  const SizedBox(height: 16),
                  if (word.meanings != null && word.meanings!.isNotEmpty)
                    PartOfSpeechSelector(
                      partsOfSpeech: word.meanings!
                          .map((m) => m.partOfSpeech ?? '')
                          .toList(),
                      selected: state.selectedPartOfSpeech,
                      onSelected: (pos) => ref
                          .read(
                            wordDetailProvider(initialPartOfSpeech).notifier,
                          )
                          .updateSelectedPartOfSpeech(pos),
                    ),
                ],
              ),
            ),
          ),

          const SliverToBoxAdapter(child: SizedBox(height: 32)),

          if (currentMeaning != null)
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              sliver: DefinitionsSection(
                definitions: currentMeaning.definitions ?? [],
              ),
            ),

          const SliverToBoxAdapter(child: SizedBox(height: 32)),
        ],
      ),
    );
  }
}
