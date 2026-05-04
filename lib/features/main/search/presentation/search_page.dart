import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meaningly/features/main/search/presentation/providers/search_notifier.dart';
import 'package:meaningly/features/main/search/presentation/search_states.dart';
import 'package:meaningly/features/main/search/presentation/widgets/search_bar_widget.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchState = ref.watch(searchProvider);
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(24.0),
              sliver: SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    Text(
                      'Meaningly',
                      style: Theme.of(context).textTheme.headlineLarge
                          ?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                            letterSpacing: 1.2,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Your comprehensive dictionary',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 48),
                    SearchBarWidget(
                      onSearch: (query) {
                        ref.read(searchProvider.notifier).search(query);
                      },
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
            _buildSearchState(context, searchState),
          ],
        ),
      ),
    );
  }
}

Widget _buildSearchState(BuildContext context, SearchStates state) {
  return switch (state) {
    SearchInitial() => SliverFillRemaining(
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
    ),
    SearchLoading() => SliverFillRemaining(
      hasScrollBody: false,
      child: const Center(child: CircularProgressIndicator()),
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
              onTap: () {},
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
