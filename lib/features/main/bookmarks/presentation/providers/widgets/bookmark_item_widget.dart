import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meaningly/features/main/bookmarks/presentation/providers/bookmark_notifier.dart';

import '../../../../../../app/router/route_names.dart';
import '../../../../search/domain/entities/dictionary_word_entity.dart';

class BookmarkItemWidget extends ConsumerWidget {
  final DictionaryWordEntity wordData;

  const BookmarkItemWidget(this.wordData, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: Theme.of(context).colorScheme.onSurface,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(
          wordData.word ?? '',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
        subtitle:
            (wordData.phonetic != null && wordData.phonetic!.trim().isNotEmpty)
            ? Text(wordData.phonetic!)
            : null,
        trailing: IconButton(
          icon: const Icon(Icons.delete, size: 24),
          onPressed: () {
            ref.read(bookmarkProvider.notifier).toggleBookmark(wordData);
          },
        ),
        onTap: () {
          context.pushNamed(RouteNames.details, extra: wordData);
        },
      ),
    );
  }
}
