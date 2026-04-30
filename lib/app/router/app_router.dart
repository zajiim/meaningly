import 'package:go_router/go_router.dart';
import 'package:meaningly/app/router/route_names.dart';
import 'package:meaningly/features/main/bookmarks/presentation/bookmarks_screen.dart';
import 'package:meaningly/features/main/home/presentation/bottom_nav_bar.dart';
import 'package:meaningly/features/main/settings/presentation/settings_screen.dart';
import 'package:meaningly/features/onboarding/presentation/onboarding_screen.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/main/home/presentation/home_page.dart';
import '../../features/splash/presentation/splash_screen.dart';

part 'app_router.g.dart';

@riverpod
GoRouter appRouter(Ref ref) {
  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        name: RouteNames.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        name: RouteNames.onBoarding,
        builder: (context, state) => const OnboardingScreen(),
      ),

      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return BottomNavBar(navigationShell: navigationShell);
        },
        branches: [StatefulShellBranch(routes: [
          GoRoute(
            path: '/home',
            name: RouteNames.home,
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: '/bookmarks',
            name: RouteNames.bookmarks,
            builder: (context, state) => const BookmarksScreen(),
          ),
          GoRoute(
            path: '/settings',
            name: RouteNames.settings,
            builder: (context, state) => const SettingsScreen(),
          ),

        ])],
      ),
    ],
  );
}
