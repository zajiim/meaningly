import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meaningly/features/onboarding/presentation/widgets/onboarding_header.dart';

import '../domain/entities/onboarding_content.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPageNotifier = ValueNotifier<int>(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          OnboardingHeader(
            pageNotifier: _currentPageNotifier,
            totalPages: _onboardingData.length,
            onSkip: () {  },

          )
        ],
      ),
    );
  }
}

final List<OnboardingContent> _onboardingData = [
  OnboardingContent(
    image: 'assets/images/onboarding_1.png',
    title: 'Discover Words Instantly',
    description:
    'Search and explore word meanings in real time with smart suggestions. Find definitions, examples, and usage within seconds.',
  ),
  OnboardingContent(
    image: 'assets/images/onboarding_2.png',
    title: 'Works Offline Anytime',
    description:
    'Access essential word meanings even without internet. Meaningly comes with built-in dictionary data for seamless offline use.',
  ),
  OnboardingContent(
    image: 'assets/images/onboarding_3.png',
    title: 'Save & Learn Faster',
    description:
    'Bookmark important words and revisit your search history to build your vocabulary efficiently over time.',
  ),
];
