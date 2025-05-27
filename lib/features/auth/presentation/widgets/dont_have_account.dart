import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/routes/routes.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_styles.dart';

class DontHaveAccount extends StatelessWidget {
  const DontHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        text: 'لا تمتلك حساب؟',
        style: getSemiBoldStyle(
          color: AppColors.lightGreyText,
          fontSize: 16.sp,
        ),
        children: [
          const TextSpan(text: ' '),
          TextSpan(
            text: 'قم بإنشاء حساب',
            style: getSemiBoldStyle(color: AppColors.primary, fontSize: 16.sp),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // Navigate to sign up page
                Navigator.pushNamed(context, Routes.register);
              },
          ),
        ],
      ),
    );
  }
}
