import 'package:evently_application/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UiUtils {
  static void showSuccessMessage(String message) => Fluttertoast.showToast(
    msg: message ?? 'Something went wrong',
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: Colors.green,
    textColor: AppColors.white,
  );

  static void showErrorMessage(String? message) => Fluttertoast.showToast(
    msg: message ?? 'Something went wrong',
    toastLength: Toast.LENGTH_LONG,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 5,
    backgroundColor: AppColors.red,
    textColor: AppColors.white,
  );
}
