import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fruit_hub/core/routes/routes.dart';
import 'package:fruit_hub/core/utils/app_images.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    executeNavigate();
  }

  @override
  Widget build(BuildContext context) {
    bool isRTL = context.locale == const Locale('ar');
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Transform.scale(
                scaleX: isRTL ? -1 : 1,
                child: SvgPicture.asset(
                  Assets.imagesSplashPlant,
                  height: 180.h,
                ),
              ),
            ],
          ),
          SvgPicture.asset(Assets.imagesFruitHupLogo, height: 200.h),
          SizedBox(
            width: double.infinity,
            child: SvgPicture.asset(
              Assets.imagesSplashCircles,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }

  void executeNavigate() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, Routes.onBoarding);
    });
  }
}
