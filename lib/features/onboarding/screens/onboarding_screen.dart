import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../core/constants/app_assets.dart';
import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_text_styles.dart';
import '../models/onboarding_model.dart';
import '../widgets/onboarding_page.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int currentIndex = 0;

  late final List<OnboardingModel> pages = [
    OnboardingModel(
      image: AppAssets.onboarding1,
      title: "Discover Products",
      description: "Explore curated fashion collections effortlessly.",
    ),
    OnboardingModel(
      image: AppAssets.onboarding2,
      title: "Fast Delivery",
      description: "Get your orders delivered quickly and safely.",
    ),
    OnboardingModel(
      image: AppAssets.onboarding3,
      title: "Secure Payment",
      description: "Shop with confidence using secure payment methods.",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _controller,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  return OnboardingPage(item: pages[index]);
                },
              ),
            ),

            SmoothPageIndicator(
              controller: _controller,
              count: pages.length,
              effect: WormEffect(
                dotHeight: 8.h,
                dotWidth: 8.w,
                activeDotColor: AppColors.primary,
              ),
            ),

            SizedBox(height: 30.h),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: ElevatedButton(
                onPressed: () {
                  if (currentIndex == pages.length - 1) {
                  } else {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 14.h),
                  child: Text(
                    currentIndex == pages.length - 1 ? "Get Started" : "Next",
                    style: AppTextStyles.button,
                  ),
                ),
              ),
            ),

            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
