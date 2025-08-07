import 'package:evently_application/core/constants/app_theme_style.dart';
import 'package:evently_application/modules/authentication/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
      //
      // routes: {
      //   HomeScreen.routeName: (_) => HomeScreen(),
      //   SplashView.routeName: (_) => SplashView(),
      //   PreIntroScreen.routeName: (_) => PreIntroScreen(),
      //   IntroScreens.routeName: (_) => IntroScreens(),
      //   LoginScreen.routeName: (_) => LoginScreen(),
      //   RegisterScreen.routeName: (_) => RegisterScreen(),
      //   CreateEventScreen.routeName : (_) => CreateEventScreen(),
      // },
      // initialRoute: SplashView.routeName, // start at splash
      home: LoginScreen(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
    );
  }
}
