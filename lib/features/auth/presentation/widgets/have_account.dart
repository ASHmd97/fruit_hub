import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_styles.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        text: ' تمتلك حساب بالفعل؟',
        style: getSemiBoldStyle(
          color: AppColors.lightGreyText,
          fontSize: 16.sp,
        ),
        children: [
          const TextSpan(text: ' '),
          TextSpan(
            text: 'تسجيل الدخول',
            style: getSemiBoldStyle(color: AppColors.primary, fontSize: 16.sp),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pop(context);
              },
          ),
        ],
      ),
    );
  }
}
