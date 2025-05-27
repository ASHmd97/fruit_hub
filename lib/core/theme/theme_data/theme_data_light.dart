// core/theme/theme_data/theme_data_light.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../app_colors.dart';
import '../app_fonts.dart';
import '../app_styles.dart';

ThemeData getLightTheme() => ThemeData(
  scaffoldBackgroundColor: AppColors.scaffoldBackground,
  brightness: Brightness.light,
  fontFamily: AppFonts.cairoFont,
  colorScheme: ColorScheme.fromSeed(
    seedColor: AppColors.primary,
    brightness: Brightness.light,
  ),
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.scaffoldBackground,
    foregroundColor: AppColors.black,
    titleTextStyle: getMediumStyle(color: AppColors.black, fontSize: 20.sp),
    centerTitle: true,
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.scaffoldBackground,
      disabledBackgroundColor: AppColors.disableButton,
      disabledForegroundColor: AppColors.scaffoldBackground,
      // elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      minimumSize: Size(double.infinity, 56.h),
    ),
  ),
  //outlined button theme
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      side: BorderSide(color: Colors.grey.shade300),
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      minimumSize: Size(double.infinity, 56.h),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
    hintStyle: getSemiBoldStyle(
      color: AppColors.lightGreyText,
      fontSize: 13.sp,
    ),
    errorStyle: getRegularStyle(color: AppColors.error, fontSize: 13.sp),
    labelStyle: getBoldStyle(color: AppColors.lightGreyText, fontSize: 13.sp),
    filled: true,
    fillColor: AppColors.light,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: AppColors.lightGrey),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: AppColors.grey),
    ),
    enabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: AppColors.lightGrey),
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: AppColors.error),
    ),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: AppColors.white,
    selectedItemColor: AppColors.primary,
    unselectedItemColor: AppColors.white[80]!,
    showUnselectedLabels: true,
    selectedLabelStyle: getRegularStyle(
      color: AppColors.primary,
      fontSize: 12.sp,
    ),
    unselectedLabelStyle: getRegularStyle(
      color: AppColors.white[80]!,
      fontSize: 12.sp,
    ),
  ),
);
