import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_styles.dart';

class CustomOutlinedBtn extends StatelessWidget {
  const CustomOutlinedBtn({
    super.key,
    required this.title,
    required this.onPressed,
    required this.icon,
  });
  final String title;
  final VoidCallback onPressed;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,

      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(alignment: Alignment.centerRight, child: icon),
          Center(
            child: Text(
              title,
              style: getSemiBoldStyle(color: AppColors.black, fontSize: 16.sp),
            ),
          ),
        ],
      ),
    );
  }
}
