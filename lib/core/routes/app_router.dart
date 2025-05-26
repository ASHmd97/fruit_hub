import 'package:flutter/material.dart';
import 'package:fruit_hub/core/routes/routes.dart';
import 'package:fruit_hub/features/auth/presentation/pages/login_page.dart';
import 'package:fruit_hub/features/onboarding/presentation/pages/on_boarding_page.dart';
import 'package:fruit_hub/features/splash/presentation/pages/splash_page.dart';

Route<dynamic>? generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.splash:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => SplashPage(),
      );

    case Routes.onBoarding:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => OnBoardingPage(),
      );

    case Routes.login:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => const LoginPage(),
      );

    default:
      return MaterialPageRoute(
        settings: settings,
        builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for ${settings.name}')),
        ),
      );
  }
}
