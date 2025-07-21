import 'package:evently_application/core/constants/app_assets.dart';
import 'package:evently_application/core/constants/app_colors.dart';
import 'package:evently_application/modules/authentication/forget_password_screen.dart';
import 'package:evently_application/modules/authentication/register_screen.dart';
import 'package:evently_application/widgets/elevated_button.dart';
import 'package:evently_application/widgets/text_form_field.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.verticalLogo),
              SizedBox(height: 24,),
              DefaultTextFormField(
                hintText: 'Email',
                controller: emailController,
                prefixIconImageName: 'email',
              ),
              SizedBox(height: 16,),
              DefaultTextFormField(
                hintText: 'Password',
                controller: passwordController,
                prefixIconImageName: 'password',
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context) => ForgetPasswordScreen())
                        );
                      },
                      child: Text('Forget Password?',
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
                      )
                  )
                ],
              ),
              SizedBox(height: 5,),
              DefaultElevatedButton(text: 'Login', onPressed: () {}),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account ?",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                      color: AppColors.black,
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(
                                builder: (context) => RegisterScreen())
                        );
                      },
                      child: Text('Create Account',
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Inter',
                            color: AppColors.primaryColor,
                            fontStyle: FontStyle.italic,
                            decorationColor: AppColors.primaryColor,
                            decorationThickness: 1,
                            decoration: TextDecoration.underline
                        ),
                      )
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
