import 'package:evently_application/core/constants/app_theme_style.dart';
import 'package:evently_application/modules/home%20screen/home_screen.dart';
import 'package:evently_application/modules/onboarding%20screens/introScreen1.dart';
import 'package:evently_application/modules/onboarding%20screens/introScreen2.dart';
import 'package:evently_application/modules/onboarding%20screens/introScreen3.dart';
import 'package:evently_application/modules/onboarding%20screens/pre_inro_screen.dart';
import 'package:evently_application/modules/splash/splash_view.dart';
import 'package:flutter/material.dart';

import 'modules/onboarding screens/intro_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: SplashView.routeNames, // start at splash
      // routes: {
      //   SplashView.routeNames: (_) => SplashView(),
      //   PreIntroScreen.routeNames: (_) => PreIntroScreen(),
      //   IntroScreens.routeNames: (_) => IntroScreens(),
      // },
      home: HomeScreen(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
