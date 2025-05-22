// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters, constant_identifier_names

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> _en = {
  "validation": {
    "firstNameEmpty": "Please enter the first name",
    "firstNameInvalid": "Please enter a valid first name",
    "lastNameEmpty": "Please enter the last name",
    "lastNameInvalid": "Please enter a valid last name",
    "emailEmpty": "Please enter the email",
    "emailInvalid": "Please enter a valid email",
    "passwordEmpty": "Please enter the password",
    "passwordInvalid": "Invalid password",
    "passwordShort": "Password must be at least 6 characters long",
    "confirmPasswordEmpty": "Please confirm the password",
    "confirmPasswordMismatch": "Passwords do not match",
    "passwordSamePassword": "The new password must be different from the current password",
    "phoneEmpty": "Please enter the phone number",
    "phoneInvalid": "Please enter a valid phone number",
    "pinCodeError": "Invalid code"
  },
  "applicationApproved": {
    "title": "Your application has been \n submitted!",
    "description": "Thank you for providing your application, we will review your application and will get back to you soon.",
    "login": "Login"
  }
};
static const Map<String,dynamic> _ar = {
  "validation": {
    "firstNameEmpty": "يرجى إدخال الاسم الأول",
    "firstNameInvalid": "الرجاء إدخال اسم أول صحيح",
    "lastNameEmpty": "يرجى إدخال اسم العائلة",
    "lastNameInvalid": "الرجاء إدخال اسم عائلة صحيح",
    "emailEmpty": "يرجى إدخال البريد الإلكتروني",
    "emailInvalid": "يرجى إدخال بريد إلكتروني صحيح",
    "passwordEmpty": "يرجى إدخال كلمة المرور",
    "passwordInvalid": "كلمة المرور غير صالحة",
    "passwordShort": "يجب أن تحتوي كلمة المرور على 6 أحرف على الأقل",
    "confirmPasswordEmpty": "يرجى تأكيد كلمة المرور",
    "confirmPasswordMismatch": "كلمتا المرور غير متطابقتين",
    "passwordSamePassword": "يجب أن تكون كلمة المرور الجديدة مختلفة عن كلمة المرور الحالية",
    "phoneEmpty": "يرجى إدخال رقم الهاتف",
    "phoneInvalid": "يرجى إدخال رقم هاتف صحيح",
    "pinCodeError": "رمز غير صحيح"
  },
  "applicationApproved": {
    "title": "تم إرسال طلبك!",
    "description": "شكرًا لتقديمك الطلب. سنقوم بمراجعة طلبك وسنعاود التواصل معك قريبًا.",
    "login": "تسجيل الدخول"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": _en, "ar": _ar};
}
