import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/di/injectable.dart';
import 'package:fruit_hub/core/theme/app_colors.dart';
import 'package:fruit_hub/core/theme/app_styles.dart';
import 'package:fruit_hub/features/auth/presentation/cubit/register_cubit.dart';
import 'package:fruit_hub/features/auth/presentation/widgets/register_page_body.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'حساب جديد',
          style: getBoldStyle(color: AppColors.black, fontSize: 19.sp),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: BlocProvider(
        create: (context) => getIt<RegisterCubit>(),

        child: RegisterPageBody(),
      ),
    );
  }
}
