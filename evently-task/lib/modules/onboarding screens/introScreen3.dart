import 'package:evently_application/core/constants/app_assets.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class IntroScreen3 extends StatelessWidget {
  const IntroScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
        child: Column(
          spacing: 28,
          children: [
            SizedBox(height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.horizontalLogo, width: 160, height: 60),
              ],
            ),
            Image.asset(Assets.onBoarding4),
            Row(
              children: [
                Text(
                  'Connect with Friends & Share Moments',
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
                  "Make every event memorable by sharing the\n"
                  "experience with others. Our platform lets you\n"
                  "invite friends, keep everyone in the loop, and\n"
                  "celebrate moments together. Capture and\n"
                  "share the excitement with your network, so\n"
                  "you can relive the highlights and cherish the\n"
                  "memories.\n",
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
