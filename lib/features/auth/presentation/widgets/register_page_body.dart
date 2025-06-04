import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/routes/routes.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_styles.dart';
import 'package:fruit_hub/core/utils/validator.dart';
import 'package:fruit_hub/core/widget/dialog_utils.dart';
import 'package:fruit_hub/features/auth/presentation/cubit/register_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/widgets/custom_checkbox.dart';
import 'package:fruit_hub/features/auth/presentation/widgets/have_account.dart';

class RegisterPageBody extends StatefulWidget {
  const RegisterPageBody({super.key});

  @override
  State<RegisterPageBody> createState() => _RegisterPageBodyState();
}

class _RegisterPageBodyState extends State<RegisterPageBody> {
  bool notVisiblePassword = true;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();
    return BlocConsumer<RegisterCubit, RegisterState>(
      bloc: cubit,
      listener: (context, state) {
        if (state is RegisterLoading) {
          DialogUtils.showLoading(context);
        } else if (state is RegisterSuccess) {
          DialogUtils.hideLoading(context);
          Navigator.of(context).pushReplacementNamed(Routes.login);
        } else if (state is RegisterFailure) {
          DialogUtils.hideLoading(context);
          DialogUtils.showErrorDialog(context, state.message);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                SizedBox(height: 20), // Space at the top
                TextFormField(
                  controller: cubit.nameController,
                  decoration: InputDecoration(
                    labelText: 'الاسم كامل',
                    hintText: 'أدخل اسمك كامل',
                  ),
                  keyboardType: TextInputType.name,
                  validator: Validator.fullNameValidation,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (_) =>
                      cubit.isFormValid(), // Validate form on name change
                ),
                SizedBox(height: 16), // Space between fields
                TextFormField(
                  controller: cubit.emailController,
                  decoration: InputDecoration(
                    labelText: 'البريد الإلكتروني',
                    hintText: 'أدخل بريدك الإلكتروني',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: Validator.emailValidate,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  onChanged: (_) =>
                      cubit.isFormValid(), // Validate form on email change
                ),
                SizedBox(height: 16), // Space between fields
                TextFormField(
                  controller: cubit.passwordController,
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
                  onChanged: (_) =>
                      cubit.isFormValid(), // Validate form on password change
                ),
                SizedBox(height: 16), // Space between fields
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CustomCheckbox(
                      isChecked: cubit.isTermsAccepted,
                      onChanged: (value) {
                        cubit.isTermsAccepted = value;
                        cubit.isFormValid();
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
                ValueListenableBuilder<bool>(
                  valueListenable: cubit.isFormValidNotifier,
                  builder: (context, isValid, child) {
                    return ElevatedButton(
                      onPressed: isValid
                          ? () {
                              cubit.registerWithEmailAndPassword();
                            }
                          : null,
                      child: Text(
                        'إنشاء حساب جديد',
                        style: getBoldStyle(
                          color: AppColors.white,
                          fontSize: 16.sp,
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 24),
                const HaveAccount(),
              ],
            ),
          ),
        );
      },
    );
  }
}
