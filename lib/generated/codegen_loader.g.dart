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
    "fullNameEmpty": "Please enter your full name",
    "fullNameTooShort": "Full name is too short",
    "fullNameTooLong": "Full name is too long",
    "fullNameInvalid": "Please enter a valid full name",
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
  "onboarding": {
    "skip": "Skip",
    "btn": "Get Started",
    "title1": "Welcome to ",
    "title2": "Explore and Shop",
    "description1": "Discover a unique shopping experience with FruitHUB. Explore our wide range of premium fresh fruits and get the best deals and high quality.",
    "description2": "We bring you the best carefully selected fruits. Check out details, images, and reviews to ensure you choose the perfect fruit."
  },
  "dialogs": {
    "error": "Error",
    "success": "Success",
    "warning": "Warning",
    "info": "Information",
    "ok": "OK",
    "cancel": "Cancel"
  }
};
static const Map<String,dynamic> _ar = {
  "validation": {
    "fullNameEmpty": "يرجى إدخال الاسم الكامل",
    "fullNameTooShort": "الاسم الكامل قصير جدًا",
    "fullNameTooLong": "الاسم الكامل طويل جدًا",
    "fullNameInvalid": "يرجى إدخال اسم كامل صحيح",
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
  "onboarding": {
    "skip": "تخط",
    "btn": "ابدأ الآن",
    "title1": "مرحبا بك في ",
    "title2": "ابحث وتسوق",
    "description1": "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
    "description2": "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية"
  },
  "dialogs": {
    "error": "خطأ",
    "success": "نجاح",
    "warning": "تحذير",
    "info": "معلومات",
    "ok": "موافق",
    "cancel": "إلغاء"
  }
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": _en, "ar": _ar};
}
