import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meaningly/features/main/search/presentation/providers/connectivity_banner_notifier.dart';

import 'connectivity_banner.dart';

class BottomNavBar extends ConsumerWidget {
  final StatefulNavigationShell navigationShell;
  const BottomNavBar({super.key, required this.navigationShell});

  void _onTap(int index) {
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final connectivityBannerState = ref.watch(connectivityBannerProvider);
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedSize(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
          child: connectivityBannerState == BannerState.hidden
              ? const SizedBox.shrink()
              : ConnectivityBanner(
            isOnline: connectivityBannerState == BannerState.restored,
          ),
        ),
          BottomNavigationBar(
            currentIndex: navigationShell.currentIndex,
            type: BottomNavigationBarType.fixed,
            // onTap: (index) => _onTap(index),
              onTap: _onTap,
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
                BottomNavigationBarItem(icon: Icon(Icons.stacked_bar_chart), label: 'Collections'),
                BottomNavigationBarItem(icon: Icon(Icons.bookmark), label: 'Bookmarks'),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
              ],
          ),
        ],
      ),
    );
  }
}
