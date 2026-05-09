import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meaningly/app/router/app_router.dart';
import 'package:meaningly/core/providers/shared_preferences_provider.dart';
import 'package:meaningly/core/providers/theme_provider.dart';
import 'package:meaningly/core/theme/app_theme.dart';
import 'package:meaningly/features/splash/presentation/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/constants/app_constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: [sharedPrefsProvider.overrideWithValue(prefs)],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  bool _splashDone = false;
  String _initialRoute = '/home';

  void _onSplashComplete(bool hasCompletedOnboarding) {
    setState(() {
      _initialRoute = hasCompletedOnboarding ? '/home' : '/onboarding';
      _splashDone = true;
    });
  }
  @override
  Widget build(BuildContext context) {
    final themeMode = ref.watch(themeProviderProvider);
    if (!_splashDone) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeMode,
        home: SplashScreen(onComplete: _onSplashComplete),
      );
    }

    final router = ref.watch(appRouterProvider(_initialRoute));
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: router,
      title: appName,
    );

  }
}
