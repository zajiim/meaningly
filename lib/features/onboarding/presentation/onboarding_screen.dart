import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:meaningly/app/router/route_names.dart';
import 'package:meaningly/features/onboarding/presentation/providers/onboarding_notifier.dart';
import 'package:meaningly/features/onboarding/presentation/widgets/onboarding_content.dart';
import 'package:meaningly/features/onboarding/presentation/widgets/onboarding_footer.dart';
import 'package:meaningly/features/onboarding/presentation/widgets/onboarding_header.dart';

import '../domain/entities/onboarding_content.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pageController = PageController();
  final ValueNotifier<int> _currentPageNotifier = ValueNotifier<int>(0);

  void _nextPage() {
    _pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }

  void _prevPage() {
    _pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _skipToLast() {
    _pageController.animateToPage(
      _onboardingData.length - 1,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              OnboardingHeader(
                pageNotifier: _currentPageNotifier,
                totalPages: _onboardingData.length,
                onSkip: _skipToLast,
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _onboardingData.length,
                  itemBuilder: (context, index) => LayoutBuilder(
                    builder: (context, constraints) => SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: constraints.maxHeight,
                        ),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24.0),
                            child: CustomOnboardingContent(
                              image: _onboardingData[index].image,
                              title: _onboardingData[index].title,
                              description: _onboardingData[index].description,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  onPageChanged: (index) => _currentPageNotifier.value = index,
                ),
              ),
              OnboardingFooter(
                  onNext: _nextPage,
                  onPrev: _prevPage,
                  onGetStarted: () async {
                    await ref.read(onboardingProvider.notifier).completeOnboarding();
                    if(context.mounted) {
                      context.goNamed(RouteNames.home);
                    }
                  }
              )
            ],
          ),
        ),
      ),
    );
  }
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
