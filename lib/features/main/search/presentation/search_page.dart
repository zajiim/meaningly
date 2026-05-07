import 'package:chopper/chopper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meaningly/core/network/connectivity_provider.dart';
import 'package:meaningly/features/main/search/presentation/providers/connectivity_banner_notifier.dart';
import 'package:meaningly/features/main/search/presentation/providers/search_notifier.dart';
import 'package:meaningly/features/main/search/presentation/search_states.dart';
import 'package:meaningly/features/main/search/presentation/widgets/connectivity_banner.dart';
import 'package:meaningly/features/main/search/presentation/widgets/search_bar_widget.dart';
import 'package:meaningly/features/main/search/presentation/widgets/search_item.dart';

class SearchPage extends ConsumerWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bannerState = ref.watch(connectivityBannerProvider);
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
                      style: Theme.of(context).textTheme.headlineLarge?.copyWith(
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
                    // AnimatedSize(
                    //   duration: const Duration(milliseconds: 300),
                    //   curve: Curves.easeInOut,
                    //   child: bannerState == BannerState.hidden
                    //       ? const SizedBox.shrink()
                    //       : Padding(
                    //     padding: const EdgeInsets.only(top: 12),
                    //     child: ConnectivityBanner(
                    //       isOnline: bannerState == BannerState.restored,
                    //     ),
                    //   ),
                    // ),
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

