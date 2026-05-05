import 'package:flutter/material.dart';

class SynonymsAntonymsSection extends StatelessWidget {
  final List<String> synonyms;
  final List<String> antonyms;

  const SynonymsAntonymsSection({
    super.key,
    required this.synonyms,
    required this.antonyms,
  });

  @override
  Widget build(BuildContext context) {
    if (synonyms.isEmpty && antonyms.isEmpty) return const SizedBox.shrink();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (synonyms.isNotEmpty)
          Expanded(
            child: _buildColumn(context, 'SYNONYMS', synonyms),
          ),
        if (synonyms.isNotEmpty && antonyms.isNotEmpty) const SizedBox(width: 24),
        if (antonyms.isNotEmpty)
          Expanded(
            child: _buildColumn(context, 'ANTONYMS', antonyms),
          ),
      ],
    );
  }

  Widget _buildColumn(BuildContext context, String title, List<String> items) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: Colors.black54,
              ),
            ),
            const SizedBox(width: 8),
            Text(
              '${items.length}',
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        ...items.take(5).map((item) => Padding(
          padding: const EdgeInsets.only(bottom: 4),
          child: Text(
            item,
            style: TextStyle(
              color: Colors.blue.shade600,
              fontSize: 16,
            ),
          ),
        )),
        if (items.length > 5)
          const Text(
            '...',
            style: TextStyle(color: Colors.blue, fontSize: 16),
          ),
      ],
    );
  }
}
