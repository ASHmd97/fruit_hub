import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fruit_hub/core/app_bloc_observer.dart';
import 'package:fruit_hub/core/di/injectable.dart';
import 'package:fruit_hub/core/routes/app_router.dart';
import 'package:fruit_hub/core/routes/navigator_observer.dart';
import 'package:fruit_hub/core/routes/routes.dart';
import 'package:fruit_hub/core/theme/theme_data/theme_data_light.dart';
import 'package:fruit_hub/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  await configureDependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      saveLocale: true,
      startLocale: const Locale('ar'),
      fallbackLocale: const Locale('en'),
      path: 'assets/translations',
      child: FruitHup(),
    ),
  );
}

class FruitHup extends StatelessWidget {
  const FruitHup({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorObservers: [getIt<AppNavigatorObserver>()],
        initialRoute: Routes.splash,
        onGenerateRoute: generateRoute,
        theme: getLightTheme(),
        darkTheme: ThemeData(),
        themeMode: ThemeMode.light,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
      ),
    );
  }
}
