import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meaningly/features/main/details/presentation/widgets/definitions_section.dart';
import 'package:meaningly/features/main/details/presentation/widgets/part_of_speech_selector.dart';
import 'package:meaningly/features/main/details/presentation/widgets/synonyms_antonyms_section.dart';
import 'package:meaningly/features/main/details/presentation/widgets/word_header_widget.dart';

import '../../search/domain/entities/dictionary_word_entity.dart';

class WordDetailsPage extends StatefulWidget {
  final DictionaryWordEntity word;
  const WordDetailsPage({super.key, required this.word});

  @override
  State<WordDetailsPage> createState() => _WordDetailsPageState();
}

class _WordDetailsPageState extends State<WordDetailsPage> {
  late String selectedPartOfSpeech;

  @override
  void initState() {
    super.initState();
    selectedPartOfSpeech = widget.word.meanings?.first.partOfSpeech ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final currentMeaning = widget.word.meanings?.firstWhere(
          (m) => m.partOfSpeech == selectedPartOfSpeech,
      orElse: () => widget.word.meanings!.first,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: TextButton.icon(
          onPressed: () => context.pop(),
          icon: const Icon(Icons.arrow_back_ios, size: 18),
          label: const Text('Search', style: TextStyle(fontSize: 16)),
        ),
        leadingWidth: 100,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            WordHeaderWidget(word: widget.word),
            const SizedBox(height: 32),
            if (widget.word.meanings != null)
              PartOfSpeechSelector(
                partsOfSpeech: widget.word.meanings!.map((m) => m.partOfSpeech ?? '').toList(),
                selected: selectedPartOfSpeech,
                onSelected: (pos) => setState(() => selectedPartOfSpeech = pos),
              ),
            const SizedBox(height: 32),
            if (currentMeaning != null) ...[
              DefinitionsSection(definitions: currentMeaning.definitions ?? []),
              const SizedBox(height: 32),
              SynonymsAntonymsSection(
                synonyms: currentMeaning.synonyms ?? [],
                antonyms: currentMeaning.antonyms ?? [],
              ),
            ],
            const SizedBox(height: 32),
            _buildEtymologySection(),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildEtymologySection() {
    // Adding this to match the screenshot, even if data is placeholder
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'ETYMOLOGY',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            letterSpacing: 1.2,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          '${widget.word.word} (first attested in 1833), from holla, hollo (attested 1588). this variant of hallo is often credited to thomas edison as a coinage for telephone use, but its appearance in print predates ...',
          style: TextStyle(
            color: Colors.grey.shade700,
            fontSize: 16,
            height: 1.4,
          ),
        ),
      ],
    );
  }
}
