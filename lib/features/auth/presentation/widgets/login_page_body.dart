import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_styles.dart';
import 'package:fruit_hub/core/utils/app_images.dart';
import 'package:fruit_hub/core/utils/validator.dart';
import 'package:fruit_hub/features/auth/presentation/widgets/custom_outlined_btn.dart';
import 'package:fruit_hub/features/auth/presentation/widgets/dont_have_account.dart';
import 'package:fruit_hub/features/auth/presentation/widgets/or_divider.dart';

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({super.key});

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  bool notVisiblePassword = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'البريد الإلكتروني'),
              keyboardType: TextInputType.emailAddress,
              validator: Validator.emailValidate,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            const SizedBox(height: 16.0),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'كلمة المرور',
                suffixIcon: GestureDetector(
                  onTap: () {
                    notVisiblePassword = !notVisiblePassword;
                    setState(() {});
                  },
                  child: notVisiblePassword
                      ? const Icon(Icons.visibility)
                      : const Icon(Icons.visibility_off),
                ),

                suffixIconColor: AppColors.lightGreyText,
              ),
              obscureText: notVisiblePassword,
              keyboardType: TextInputType.visiblePassword,
              validator: Validator.passwordValidation,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            const SizedBox(height: 12.0),
            SizedBox(
              width: double.infinity,
              child: Align(
                alignment: AlignmentDirectional.centerEnd,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'نسيت كلمة المرور؟',
                    style: getSemiBoldStyle(
                      color: AppColors.primary,
                      fontSize: 13.0.sp,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                'تسجيل الدخول',
                style: getBoldStyle(color: AppColors.white, fontSize: 16.sp),
              ),
            ),
            const SizedBox(height: 16.0),
            DontHaveAccount(),
            const SizedBox(height: 16.0),
            OrDivider(),
            const SizedBox(height: 16.0),
            CustomOutlinedBtn(
              onPressed: () {},
              title: 'تسجيل بواسطة جوجل',
              icon: SvgPicture.asset(
                Assets.imagesGoogleIcons,
                width: 24.w,
                height: 24.h,
              ),
            ),
            SizedBox(height: 16.h),
            CustomOutlinedBtn(
              title: 'تسجيل بواسطة أبل',
              onPressed: () {},
              icon: SvgPicture.asset(Assets.imagesAppleIcons, width: 24.w),
            ),
            SizedBox(height: 16.h),
            CustomOutlinedBtn(
              title: 'تسجيل بواسطة فيسبوك',
              onPressed: () {},
              icon: SvgPicture.asset(Assets.imagesFacebookIcons, width: 24.w),
            ),
          ],
        ),
      ),
    );
  }
}
