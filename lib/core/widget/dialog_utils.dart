import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/widget/loading_indicator.dart';
import 'package:fruit_hub/generated/locale_keys.g.dart';
import 'package:injectable/injectable.dart';

@singleton
class DialogUtils {
  static void showLoading(BuildContext context) => showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => PopScope(
      canPop: false,
      child: AlertDialog(
        content: SizedBox(
          height: MediaQuery.sizeOf(context).height * 0.2,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [LoadingIndicator()],
          ),
        ),
      ),
    ),
  );
  static void hideLoading(BuildContext context) => Navigator.of(context).pop();

  static void showSnackBar({
    required Color textColor,
    required String message,
    required BuildContext context,
    Duration duration = const Duration(seconds: 5),
  }) {
    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(Icons.info_outline, color: textColor, size: 24.sp),
              SizedBox(width: 10.w),
              Expanded(
                child: Text(
                  message,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: Colors.black.withValues(
            red: 0,
            green: 0,
            blue: 0,
            alpha: 0.8,
          ),
          duration: duration,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          elevation: 8,
          margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        ),
      );
  }

  static void showErrorDialog(BuildContext context, String content) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(child: Text(LocaleKeys.dialogs_error.tr())),
          content: Text(content),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text(LocaleKeys.dialogs_ok.tr()),
            ),
          ],
        );
      },
    );
  }
}
