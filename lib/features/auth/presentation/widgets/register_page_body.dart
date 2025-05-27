import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_styles.dart';
import 'package:fruit_hub/core/utils/validator.dart';
import 'package:fruit_hub/features/auth/presentation/widgets/custom_checkbox.dart';
import 'package:fruit_hub/features/auth/presentation/widgets/have_account.dart';

class RegisterPageBody extends StatefulWidget {
  const RegisterPageBody({super.key});

  @override
  State<RegisterPageBody> createState() => _RegisterPageBodyState();
}

class _RegisterPageBodyState extends State<RegisterPageBody> {
  bool notVisiblePassword = true;
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            SizedBox(height: 20), // Space at the top
            TextFormField(
              decoration: InputDecoration(
                labelText: 'الاسم كامل',
                hintText: 'أدخل اسمك كامل',
              ),
              keyboardType: TextInputType.name,
              // validator: Validator.nameValidation,
              // autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            SizedBox(height: 16), // Space between fields
            TextFormField(
              decoration: InputDecoration(
                labelText: 'البريد الإلكتروني',
                hintText: 'أدخل بريدك الإلكتروني',
              ),
              keyboardType: TextInputType.emailAddress,
              validator: Validator.emailValidate,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
            SizedBox(height: 16), // Space between fields
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
            SizedBox(height: 16), // Space between fields
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomCheckbox(
                  isChecked: isTermsAccepted,
                  onChanged: (value) {
                    isTermsAccepted = value;
                    setState(() {});
                  },
                ),
                SizedBox(width: 16), // Space between checkbox and text
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      text: 'من خلال إنشاء حساب ، فإنك توافق على ',

                      style: getSemiBoldStyle(
                        color: AppColors.lightGreyText,
                        fontSize: 13.sp,
                      ),
                      children: [
                        TextSpan(
                          text: 'الشروط والأحكام الخاصة بنا',
                          style: getSemiBoldStyle(
                            color: AppColors.lightPrimary,
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 32),
            ElevatedButton(
              child: Text(
                'إنشاء حساب جديد',
                style: getBoldStyle(color: AppColors.white, fontSize: 16.sp),
              ),
              onPressed: () {},
            ),
            SizedBox(height: 24),
            const HaveAccount(),
          ],
        ),
      ),
    );
  }
}
