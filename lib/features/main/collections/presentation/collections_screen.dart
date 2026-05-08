import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meaningly/features/main/collections/presentation/collections_states.dart';
import 'package:meaningly/features/main/collections/presentation/providers/collections_search_notifier.dart';
import 'package:meaningly/features/main/collections/presentation/widgets/collection_search_bar.dart';
import 'package:meaningly/features/splash/di/splash_di_providers.dart';

import '../../../../app/router/route_names.dart';
import '../data/mappers/dictionary_collection_mapper.dart';

class CollectionsScreen extends ConsumerWidget {
  const CollectionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dictionaryAsync = ref.watch(splashDictionaryProvider);
    final searchState = ref.watch(collectionsSearchProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "Offline Data",
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: CollectionsSearchBar(
              onChanged: (query) {
                ref.read(collectionsSearchProvider.notifier).getSuggestions(query);
              },
              onSubmitted: (query) {
                ref.read(collectionsSearchProvider.notifier).search(query);
              },
              onClear: () {
                ref.read(collectionsSearchProvider.notifier).clear();
              },
            ),
          ),
        ),
      ),
      body: _buildBody(context, ref, dictionaryAsync, searchState),
    );
  }

  Widget _buildBody(
      BuildContext context,
      WidgetRef ref,
      AsyncValue<Map<String, String>> dictionaryAsync,
      CollectionsStates searchState,
      ) {
    if (searchState is CollectionsSuggestionsLoaded) {
      final suggestions = searchState.suggestions;
      if (suggestions.isEmpty) {
        return const Center(child: Text("No suggestions found."));
      }
      return ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context, index) {
          final suggestion = suggestions[index];
          return ListTile(
            leading: const Icon(Icons.search, size: 20),
            title: Text(
              suggestion,
              style: TextStyle(
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            trailing: const Icon(Icons.north_west, size: 16),
            onTap: () {
              ref.read(collectionsSearchProvider.notifier).search(suggestion);
            },
          );
        },
      );
    }

    return dictionaryAsync.when(
      data: (dictionary) {
        final query = searchState.query;
        final entries = query.isEmpty
            ? dictionary.entries.toList()
            : dictionary.entries
            .where((e) => e.key.toLowerCase().startsWith(query))
            .toList();

        if (entries.isEmpty) {
          return const Center(child: Text("No words found."));
        }

        return ListView.builder(
          itemCount: entries.length,
          itemBuilder: (context, index) {
            final entry = entries[index];
            return ListTile(
              title: Text(
                entry.key,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
              subtitle: Text(
                entry.value,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () {
                final entity = entry.value.toEntityFromOffline(entry.key);
                context.pushNamed(RouteNames.details, extra: entity);
              },
            );
          },
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, st) => Center(child: Text('Error loading dictionary: $e')),
    );
  }
}