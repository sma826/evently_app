import 'package:evently_application/core/constants/app_assets.dart';
import 'package:evently_application/core/constants/app_colors.dart';
import 'package:evently_application/modules/authentication/forget_password_screen.dart';
import 'package:evently_application/modules/authentication/register_screen.dart';
import 'package:evently_application/modules/home%20screen/home_screen.dart';
import 'package:evently_application/widgets/elevated_button.dart';
import 'package:evently_application/widgets/text_form_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = '/login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future signInWithGoogle(BuildContext context) async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return null;

    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.of(
      context,
    ).push(MaterialPageRoute(builder: (context) => HomeScreen()));
    // Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswordScreen()));
  }

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
              SizedBox(height: 24),
              DefaultTextFormField(
                hintText: 'Email',
                controller: emailController,
                prefixIconImageName: 'email',
              ),
              SizedBox(height: 16),
              DefaultTextFormField(
                hintText: 'Password',
                controller: passwordController,
                prefixIconImageName: 'password',
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgetPasswordScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Forget Password?',
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
              SizedBox(height: 5),
              DefaultElevatedButton(text: 'Login', onPressed: () {}),
              SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account ?",
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
                        MaterialPageRoute(
                          builder: (context) => RegisterScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'Create Account',
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
              SizedBox(height: 24),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: AppColors.primaryColor,
                      indent: 15,
                      endIndent: 10,
                      thickness: 1.25,
                    ),
                  ),
                  Text(
                    "or",
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Inter',
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: AppColors.primaryColor,
                      indent: 15,
                      endIndent: 10,
                      thickness: 1.25,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.backgroundLight,
                  padding: EdgeInsets.symmetric(horizontal: 74, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: AppColors.primaryColor, width: 1),
                  ),
                ),
                onPressed: () => signInWithGoogle(context),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/google.svg"),
                    SizedBox(width: 10),
                    Text(
                      "Login With Google",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Inter',
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
