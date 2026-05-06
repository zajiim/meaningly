import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meaningly/features/main/collections/presentation/providers/bundled_dictionary_provider.dart';

import '../../../../app/router/route_names.dart';
import '../../search/domain/entities/dictionary_word_entity.dart';
import '../../search/presentation/widgets/search_bar_widget.dart';
import '../data/mappers/dictionary_collection_mapper.dart';

class CollectionsScreen extends ConsumerStatefulWidget {
  const CollectionsScreen({super.key});

  @override
  ConsumerState<CollectionsScreen> createState() => _CollectionsScreenState();
}

class _CollectionsScreenState extends ConsumerState<CollectionsScreen> {
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final dictionaryAsync = ref.watch(bundledDictionaryProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'Meaningly',
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
            letterSpacing: 1.2,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: SearchBarWidget(
              onSearch: (query) {
                setState(() {
                  _searchQuery = query.toLowerCase();
                });
              },
            ),
          ),
        ),
      ),
      body: dictionaryAsync.when(
        data: (dictionary) {
          final entries = dictionary.entries
              .where((e) => e.key.toLowerCase().startsWith(_searchQuery))
              // .take(100)
              .toList();
          // final entries = _searchQuery.isEmpty
          //     ? dictionary.entries.toList()
          //     : dictionary.entries
          //     .where((e) => e.key.startsWith(_searchQuery))
          //     .toList();

          if (entries.isEmpty) {
            return const Center(child: Text("No words found."));
          }

          return ListView.builder(
            itemCount: entries.length,
            itemBuilder: (context, index) {
              final entry = entries[index];
              return ListTile(
                title: Text(entry.key,
                    style: TextStyle(fontWeight: FontWeight.bold, color: Theme.of(context).textTheme.bodyLarge?.color)),
                subtitle: Text(
                  entry.value,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                onTap: () {
                  // final entity = DictionaryWordEntity.fromLocalDictionary(entry.key, entry.value);
                  final entity = entry.value.toEntityFromOffline(entry.key);
                  context.pushNamed(RouteNames.details, extra: entity);
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, st) => Center(child: Text('Error loading dictionary: $e')),
      ),
    );
  }
}
