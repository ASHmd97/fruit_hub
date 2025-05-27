import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/utils/app_images.dart';

class CustomCheckbox extends StatelessWidget {
  const CustomCheckbox({
    super.key,
    required this.onChanged,
    required this.isChecked,
  });
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(!isChecked);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        height: 24.h,
        width: 24.w,
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          color: isChecked ? AppColors.primary : AppColors.white,
          border: Border.all(
            color: isChecked ? AppColors.primary : AppColors.lightGrey,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: isChecked
            ? SvgPicture.asset(Assets.imagesCheckIcon, width: 16, height: 16)
            : const SizedBox.shrink(),
      ),
    );
  }
}
