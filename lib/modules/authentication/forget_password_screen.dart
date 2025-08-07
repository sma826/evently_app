import 'package:evently_application/core/constants/app_colors.dart';
import 'package:evently_application/widgets/elevated_button.dart';
import 'package:flutter/material.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundLight,
        title: Text(
          "Forget Password",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: AppColors.black,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Image.asset('assets/images/change-setting.png'),
            SizedBox(height: 24),
            DefaultElevatedButton(text: "Reset Password", onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
