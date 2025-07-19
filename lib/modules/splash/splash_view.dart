import 'package:evently_application/core/constants/app_assets.dart';
import 'package:evently_application/modules/onboarding%20screens/intro_pages.dart';
import 'package:evently_application/modules/onboarding%20screens/pre_inro_screen.dart';
import 'package:flutter/material.dart';

class SplashView extends StatefulWidget {
  static var routeNames = '/splash_screen';

  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PreIntroScreen()),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 140),
          Image.asset(Assets.verticalLogo),
          SizedBox(height: 22),
          Image.asset(Assets.splashBottomLogo),
        ],
      ),
    );
  }
}
