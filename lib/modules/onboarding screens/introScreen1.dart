import 'package:evently_application/core/constants/app_assets.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class IntroScreen1 extends StatelessWidget {
  const IntroScreen1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        child: Column(
          spacing: 28,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.horizontalLogo, width: 160, height: 60),
              ],
            ),
            Image.asset(Assets.onBoarding2),
            Row(
              children: [
                Text(
                  'Find Events That Inspire You',
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
                  "Dive into a world of events crafted to fit your\n"
                  "unique interests. Whether you're into live\n"
                  "music, art workshops, professional networking,\n"
                  "or simply discovering new experiences, we\n"
                  "have something for everyone. Our curated\n"
                  "recommendations will help you explore,\n"
                  "connect, and make the most of every\n"
                  "opportunity around you.",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Inter',
                    color: AppColors.blackFont,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
