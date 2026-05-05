import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meaningly/app/router/route_names.dart';

import '../providers/search_notifier.dart';
import '../search_states.dart';

class SearchItem extends ConsumerWidget {
  const SearchItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(searchProvider);
    return switch (state) {
      SearchInitial(history: final history) => history.isEmpty
          ? SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.search, size: 64, color: Colors.grey.shade300),
              const SizedBox(height: 16),
              Text(
                'Start searching for words!',
                style: TextStyle(color: Colors.grey.shade500),
              ),
            ],
          ),
        ),
      )
          : SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        sliver: SliverMainAxisGroup(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Recent Searches',
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // ref.read(searchProvider.notifier).clearHistory();
                      },
                      child: const Text('Clear All'),
                    ),
                  ],
                ),
              ),
            ),
            SliverList.builder(
              itemCount: history.length,
              itemBuilder: (context, index) {
                final query = history[index];
                return ListTile(
                  leading: const Icon(Icons.history, size: 20),
                  title: Text(query),
                  trailing: const Icon(Icons.north_west, size: 16),
                  contentPadding: EdgeInsets.zero,
                  onTap: () {
                    ref.read(searchProvider.notifier).search(query);
                  },
                );
              },
            ),
          ],
        ),
      ),

      SearchLoading() => const SliverFillRemaining(
        hasScrollBody: false,
        child: Center(child: CircularProgressIndicator()),
      ),
      SearchLoaded(results: final results) => SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        sliver: SliverList.builder(
          itemCount: results.length,
          itemBuilder: (context, index) {
            final word = results[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                title: Text(
                  word.word ?? '',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(word.phonetic ?? ''),
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                onTap: () {
                  context.pushNamed(RouteNames.details, extra: word);
                },
              ),
            );
          },
        ),
      ),
      SearchError(message: final message) => SliverFillRemaining(
        hasScrollBody: false,
        child: Center(
          child: Text(
            message,
            style: const TextStyle(color: Colors.red),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    };
  }
}

