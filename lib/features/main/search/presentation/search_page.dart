import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meaningly/features/main/search/presentation/providers/search_notifier.dart';
import 'package:meaningly/features/main/search/presentation/widgets/search_bar_widget.dart';
import 'package:meaningly/features/main/search/presentation/widgets/search_item.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                      onChanged: (query) {
                        ref.read(searchProvider.notifier).getSuggestions(query);
                      },
                      onSubmitted: (query) {
                        ref.read(searchProvider.notifier).search(query);
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SearchItem(),
          ],
        ),
      ),
    );
  }
}
