import 'package:evently_application/core/constants/app_theme_style.dart';
import 'package:evently_application/modules/home%20screen/home_screen.dart';
import 'package:evently_application/providers/events_provider.dart';
import 'package:evently_application/providers/settings_provider.dart';
import 'package:evently_application/providers/user_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'l10n/app_localizations.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => EventsProvider()..getEvents()),
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
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
      home: HomeScreen(),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: settingsProvider.themeMode,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(settingsProvider.languageCode),
    );
  }
}
