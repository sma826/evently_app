import 'package:evently_application/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class DefaultElevatedButton extends StatelessWidget {
  String text;

  VoidCallback onPressed;

  DefaultElevatedButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        // padding: EdgeInsets.symmetric(horizontal: 156,vertical: 16),
        fixedSize: Size(MediaQuery.sizeOf(context).width, 56),
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w500,
          fontFamily: 'Inter',
          color: AppColors.white,
        ),
      ),
    );
  }
}
