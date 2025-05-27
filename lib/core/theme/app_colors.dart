import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const scaffoldBackground = Color(0xffffffff);

  static const primary = Color(0xff1a5e37);

  static const black = MaterialColor(0xff0C1015, <int, Color>{
    10: Color(0xff0C1015),
  });

  static const white = MaterialColor(0xffF9F9F9, <int, Color>{
    10: Color(0xfffefefe),
    20: Color(0xfffdfdfd),
    30: Color(0xfffcfcfc),
    40: Color(0xfffbfbfb),
    50: Color(0xfffafafa),
    60: Color(0xffd0d0d0),
    70: Color(0xffa6a6a6),
    80: Color(0xff7d7d7d),
    90: Color(0xff535353),
    100: Color(0xff323232),
  });

  static const grey = Color(0xff535353);
  static const lightGreyText = Color(0xff949d9e);

  static const light = Color(0xffF9FAFA);

  static const lightGrey = Color(0xffe5e9ea);

  static const disableButton = Color(0xff878787);

  static const error = Color(0xffCC1010);

  static const success = Color(0xff0CB359);

  static const lightPink = Color(0xffF9ECF0);

  // Grayscale
  static const grayscale = MaterialColor(
    0xff181A18, // 900
    <int, Color>{
      10: Color(0xff181A18), // 900
      20: Color(0xff313535), // 800
      30: Color(0xff494F50), // 700
      40: Color(0xff616A6B), // 600
      50: Color(0xff949D9E), // 500
      60: Color(0xffAFB5B6), // 400
      70: Color(0xffCAECEC), // 300
      80: Color(0xffE4E6E7), // 200
      90: Color(0xff0C0D0D), // 100
      100: Color(0xffF2F3F3), // 50
    },
  );

  // Green
  static const green = Color(0xff1B5E37);

  // Orange
  static const orange = Color(0xffF4A91F);
}
