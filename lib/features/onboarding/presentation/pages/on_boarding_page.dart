import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:fruit_hub/core/app_data/local_storage/local_storage_client.dart';
import 'package:fruit_hub/core/di/injectable.dart';
import 'package:fruit_hub/core/routes/routes.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_styles.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/features/onboarding/presentation/widgets/page_view_item.dart';
import 'package:fruit_hub/generated/locale_keys.g.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'dart:ui' as ui;

class OnBoardingPage extends StatefulWidget {
  OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
  final LocalStorageClient localStorageClient = getIt<LocalStorageClient>();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final pageController = PageController();
  int currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    // Check if the user has already seen the onboarding
    widget.localStorageClient.saveData('hasSeenOnboarding', 'true');
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              child: PageView(
                physics: const BouncingScrollPhysics(),
                allowImplicitScrolling: false,
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    currentPageIndex = index;
                  });
                },

                children: [
                  Stack(
                    children: [
                      PageViewItem(
                        imagePath: Assets.imagesOnBoardingFruitBasket,
                        bgImagePath: Assets.imagesOnBoardingBg1,
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              LocaleKeys.onboarding_title1.tr(),
                              style: getBoldStyle(
                                color: AppColors.black,
                                fontSize: 23,
                              ),
                            ),
                            Directionality(
                              textDirection: ui.TextDirection.ltr,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    "Fruit",
                                    style: getBoldStyle(
                                      color: AppColors.green,
                                      fontSize: 23,
                                    ),
                                  ),
                                  Text(
                                    "HUB",
                                    style: getBoldStyle(
                                      color: AppColors.orange,
                                      fontSize: 23,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        description: LocaleKeys.onboarding_description1.tr(),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                          start: 16.0,
                          top: 46.0,
                        ),
                        child: TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              Routes.login,
                            );
                          },
                          child: Text(
                            LocaleKeys.onboarding_skip.tr(),
                            textAlign: TextAlign.end,
                            style: getBoldStyle(
                              color: AppColors.grey,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  PageViewItem(
                    imagePath: Assets.imagesOnBoardingPineapple,
                    bgImagePath: Assets.imagesOnBoardingBg2,
                    title: Text(
                      LocaleKeys.onboarding_title2.tr(),
                      style: getBoldStyle(color: AppColors.black, fontSize: 23),
                    ),
                    description: LocaleKeys.onboarding_description2.tr(),
                  ),
                ],
              ),
            ),
            AnimatedSmoothIndicator(
              activeIndex: currentPageIndex,
              count: 2,
              effect: WormEffect(
                dotColor: AppColors.disableButton,
                activeDotColor: AppColors.green,
                dotHeight: 10.0,
                dotWidth: 10.0,
                spacing: 8.0,
              ),
            ),
            const SizedBox(height: 32),
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return SlideTransition(
                  position: Tween<Offset>(
                    begin: const Offset(0.0, 0.0),
                    end: Offset.zero,
                  ).animate(animation),
                  child: FadeTransition(opacity: animation, child: child),
                );
              },
              child: currentPageIndex == 1
                  ? Container(
                      key: const ValueKey('start_button'),
                      padding: const EdgeInsets.all(16.0),
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, Routes.login);
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: AppColors.green,
                          padding: const EdgeInsets.symmetric(vertical: 16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(
                          LocaleKeys.onboarding_btn.tr(),
                          style: getBoldStyle(
                            color: AppColors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(key: ValueKey('empty')),
            ),
          ],
        ),
      ),
    );
  }
}
