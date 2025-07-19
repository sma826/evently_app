import 'package:evently_application/core/constants/app_assets.dart';
import 'package:evently_application/modules/onboarding%20screens/intro_pages.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class PreIntroScreen extends StatefulWidget {
  static var routeNames = '/pre_intro_screen';

  const PreIntroScreen({super.key});

  @override
  State<PreIntroScreen> createState() => _PreIntroScreenState();
}

class _PreIntroScreenState extends State<PreIntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          spacing: 28,
          children: [
            SizedBox(height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.horizontalLogo, width: 200, height: 70),
              ],
            ),
            Image.asset(Assets.onBoarding1),
            Row(
              children: [
                Text(
                  'Personalize Your Experience',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Inter',
                    color: AppColors.primaryColor,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Choose your preferred theme and language to\n"
                  "get started with a comfortable, tailored\n"
                  "experience that suits your style.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                    color: AppColors.blackFont,
                  ),
                ),
              ],
            ),
            SizedBox(height: 100),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => IntroScreens()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                padding: EdgeInsets.symmetric(horizontal: 140, vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                "Let's Start",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Inter',
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
