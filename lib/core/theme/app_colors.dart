import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  static const scaffoldBackground = Color(0xffF9F9F9);

  static const primary = Color.fromARGB(255, 56, 25, 38);

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
  static const green = MaterialColor(
    0xff12704B, // 900
    <int, Color>{
      10: Color(0xff12704B), // 900
      20: Color(0xff225610), // 800
      30: Color(0xff43AC20), // 700
      40: Color(0xff76F232), // 600
      50: Color(0xff97E7E9), // 500
      60: Color(0xffF0DF5A), // 400
      70: Color(0xffDCFCE7), // 200
      80: Color(0xff0B1504), // 100
      90: Color(0xffEEFBEA), // 50
      100: Color(0xff22C55E), // 0
    },
  );

  // Orange
  static const orange = MaterialColor(
    0xff321002, // 900
    <int, Color>{
      10: Color(0xff321002), // 900
      20: Color(0xff614105), // 800
      30: Color(0xff921107), // 700
      40: Color(0xffC26200), // 600
      50: Color(0xffF583D0), // 500
      60: Color(0xffF876D0), // 400
      70: Color(0xffFADA0E), // 300
      80: Color(0xffFEDECE), // 200
      90: Color(0xffF81001), // 100
      100: Color(0xffFEE6E7), // 50
    },
  );

  // Green1
  static const green1 = MaterialColor(
    0xff082817, // 900
    <int, Color>{
      10: Color(0xff082817), // 900
      20: Color(0xff174F2E), // 800
      30: Color(0xff227745), // 700
      40: Color(0xff2D9F50), // 600
      50: Color(0xff8D0DAB), // 500
      60: Color(0xff80ECE7), // 400
      70: Color(0xffD7FAE3), // 300
      80: Color(0xff0F7E43), // 200
      90: Color(0xff06140C), // 100
      100: Color(0xffEBF9F1), // 50
    },
  );
}
