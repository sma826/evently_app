import 'package:evently_application/core/constants/app_theme_style.dart';
import 'package:evently_application/modules/home%20screen/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //     timePickerTheme: TimePickerThemeData(
      //       backgroundColor: AppColors.backgroundLight,
      //       dialBackgroundColor: Colors.blue.shade50,
      //       dialHandColor: AppColors.primaryColor,
      //       hourMinuteColor: Colors.blue.shade50,
      //       hourMinuteTextColor: AppColors.black,
      //       dayPeriodColor: Colors.blue.shade50,
      //     ),
      //     datePickerTheme: DatePickerThemeData(
      //       backgroundColor: Colors.blue.shade50,
      //     )
      // ),
      debugShowCheckedModeBanner: false,
      // initialRoute: SplashView.routeName, // start at splash
      // routes: {
      //   HomeScreen.routeName: (_) => HomeScreen(),
      //   SplashView.routeName: (_) => SplashView(),
      //   PreIntroScreen.routeName: (_) => PreIntroScreen(),
      //   IntroScreens.routeName: (_) => IntroScreens(),
      //   LoginScreen.routeName: (_) => LoginScreen(),
      //   RegisterScreen.routeName: (_) => RegisterScreen(),
      //   CreateEventScreen.routeName : (_) => CreateEventScreen(),
      // },
      home: HomeScreen(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
