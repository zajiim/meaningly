import 'package:go_router/go_router.dart';
import 'package:meaningly/app/router/route_names.dart';
import 'package:meaningly/features/main/bookmarks/presentation/bookmarks_screen.dart';
import 'package:meaningly/features/main/collections/presentation/collections_screen.dart';
import 'package:meaningly/features/main/search/data/models/dictionary_word_model.dart';
import 'package:meaningly/features/main/search/domain/entities/dictionary_word_entity.dart';
import 'package:meaningly/features/main/search/presentation/search_page.dart';
import 'package:meaningly/features/main/settings/presentation/settings_screen.dart';
import 'package:meaningly/features/onboarding/presentation/onboarding_screen.dart';
import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../features/main/details/presentation/word_detail_page.dart';
import '../../features/main/search/presentation/widgets/bottom_nav_bar.dart';
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
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/home',
                name: RouteNames.home,
                builder: (context, state) => const SearchPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/collections',
                name: RouteNames.collections,
                builder: (context, state) => const CollectionsScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/bookmarks',
                name: RouteNames.bookmarks,
                builder: (context, state) => const BookmarksScreen(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: '/settings',
                name: RouteNames.settings,
                builder: (context, state) => const SettingsScreen(),
              ),
            ],
          ),
        ],
      ),
      GoRoute(
          path: '/details',
        name: RouteNames.details,
        builder: (context, state) {
            final word = state.extra as DictionaryWordEntity;
            // return WordDetailsPage(word: word);
            return WordDetailPage(word);
        }
      )
    ],
  );
}
