import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_styles.dart';

class PageViewItem extends StatelessWidget {
  const PageViewItem({
    super.key,
    required this.imagePath,
    required this.bgImagePath,
    required this.title,
    required this.description,
  });
  final String imagePath;
  final String bgImagePath;
  final Widget title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              SvgPicture.asset(bgImagePath, fit: BoxFit.fill, height: 450.h),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: SvgPicture.asset(imagePath),
              ),
            ],
          ),
          SizedBox(height: 46.h),
          title,
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.w),
            child: Text(
              description,
              style: getSemiBoldStyle(color: AppColors.black),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
