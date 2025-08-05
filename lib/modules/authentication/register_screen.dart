import 'package:evently_application/firebase_service.dart';
import 'package:evently_application/modules/home%20screen/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../core/constants/app_assets.dart';
import '../../core/constants/app_colors.dart';
import '../../ui_utils.dart';
import '../../widgets/elevated_button.dart';
import '../../widgets/text_form_field.dart';
import 'login_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeName = '/register';

  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.verticalLogo),
                SizedBox(height: 24),
                DefaultTextFormField(
                  hintText: 'Name',
                  controller: nameController,
                  prefixIconImageName: 'name',
                  validator: (value) {
                    if (value == null || value.length < 3) {
                      return 'invalid name';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                DefaultTextFormField(
                  hintText: 'Email',
                  controller: emailController,
                  prefixIconImageName: 'email',
                  validator: (value) {
                    if (value == null || value.length < 5) {
                      return 'invalid email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                DefaultTextFormField(
                  hintText: 'Password',
                  controller: passwordController,
                  prefixIconImageName: 'password',
                  isPassword: true,
                  validator: (value) {
                    if (value == null || value.length < 8) {
                      return 'password must be at least 8 characters';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                DefaultTextFormField(
                  hintText: 'Re Password',
                  controller: rePasswordController,
                  prefixIconImageName: 'password',
                  isPassword: true,
                  validator: (value) {
                    if (value != passwordController.text) {
                      return "doesn't match";
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16),
                DefaultElevatedButton(text: 'Login', onPressed: () {
                  register();
                }),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already Have Account ?",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter',
                        color: AppColors.black,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) =>
                              LoginScreen()),
                        );
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Inter',
                          color: AppColors.primaryColor,
                          fontStyle: FontStyle.italic,
                          decorationColor: AppColors.primaryColor,
                          decorationThickness: 1,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void register() {
    if (formKey.currentState!.validate()) {
      FirebaseService.register(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
      ).then((user) {
        Navigator.of(
          context,
        ).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen()));
      }).catchError((error) {
        String? errorMessage;
        if (error is FirebaseAuthException) {
          errorMessage = error.message;
        }
        UiUtils.showErrorMessage(errorMessage);
      });
    }
  }
}
