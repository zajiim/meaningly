import 'package:flutter/material.dart';

import '../../../search/domain/entities/dictionary_word_entity.dart';

class DefinitionsSection extends StatelessWidget {
  final List<Definition> definitions;
  const DefinitionsSection({super.key, required this.definitions});

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'DEFINITIONS',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    '${definitions.length}',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SliverToBoxAdapter(child: const SizedBox(height: 16)),
        SliverList.separated(
          itemCount: definitions.length,
          separatorBuilder: (context, index) => const SizedBox(height: 16),
          itemBuilder: (context, index) {
            final def = definitions[index];
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${index + 1}. ',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      RichText(
                        text: TextSpan(
                          style: TextStyle(color: Theme.of(context).textTheme.bodyLarge?.color, fontSize: 16, height: 1.4),
                          children: _buildHighlightedText(def.definition ?? ''),
                        ),
                      ),
                      if (def.example != null) ...[
                        const SizedBox(height: 4),
                        Text(
                          '"${def.example}"',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  List<TextSpan> _buildHighlightedText(String text) {
    final List<TextSpan> spans = [];
    final RegExp regExp = RegExp(r'\((.*?)\)');
    int start = 0;

    for (final match in regExp.allMatches(text)) {
      if (match.start > start) {
        spans.add(TextSpan(text: text.substring(start, match.start)));
      }
      spans.add(TextSpan(
        text: '(${match.group(1)})',
        style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.w500),
      ));
      start = match.end;
    }

    if (start < text.length) {
      spans.add(TextSpan(text: text.substring(start)));
    }

    if (spans.isEmpty) {
      spans.add(TextSpan(text: text));
    }

    return spans;
  }
}
