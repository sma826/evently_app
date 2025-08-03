import 'package:evently_application/core/constants/app_assets.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_colors.dart';

class IntroScreen2 extends StatelessWidget {
  const IntroScreen2({super.key});

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
            Image.asset(Assets.onBoarding3),
            Row(
              children: [
                Text(
                  'Effortless Event Planning',
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
                  "Take the hassle out of organizing events with\n"
                  "our all-in-one planning tools. From setting up\n"
                  "invites and managing RSVPs to scheduling\n"
                  "reminders and coordinating details, we’ve got\n"
                  "you covered. Plan with ease and focus on what\n"
                  "matters – creating an unforgettable experience\n"
                  "for you and your guests.\n",
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
