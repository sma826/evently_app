import 'package:evently_application/core/constants/app_colors.dart';
import 'package:evently_application/taps/profile/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  // String selectedLanguage = "Arabic";
  // String selectedTheme = "Light";

  final List<Language> languages = [
    Language(name: "English", code: "en"),
    Language(name: "العربية", code: "ar")
  ];

  // final List<String> themes = ["Light", "Dark"];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ProfileHeader(),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text("Language",
            style: TextStyle(
              color: AppColors.black,
              fontSize: 20,
              fontWeight: FontWeight.w700,
              fontFamily: 'Inter',
            ),
          ),
        ),
        SizedBox(height: 8,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: DropdownButtonFormField(
            value: 'en',
            decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(16)
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(16)
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: AppColors.primaryColor, width: 1),
                  borderRadius: BorderRadius.circular(16)
              ),
            ),
            dropdownColor: AppColors.white,
            style: TextStyle(
                color: AppColors.primaryColor, fontWeight: FontWeight.bold),
            iconEnabledColor: AppColors.primaryColor,
            items: languages.map((language) =>
                DropdownMenuItem(
                    value: language.code,
                    child: Text(language.name))
            ).toList(),
            onChanged: (value) {
              setState(() {
              });
            },
          ),
        ),
        SizedBox(height: 30,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Dark Theme",
                style: TextStyle(
                  color: AppColors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Inter',
                ),
              ),
              Switch(
                value: true,
                onChanged: (value) {},
                activeTrackColor: AppColors.primaryColor,
                inactiveTrackColor: AppColors.grey,
                inactiveThumbColor: AppColors.white,
              )
            ],
          ),
        ),
        // SizedBox(height: 8,),
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 16),
        //   child: DropdownButtonFormField(
        //     decoration: InputDecoration(
        //       border: OutlineInputBorder(
        //           borderSide: BorderSide(
        //               color: AppColors.primaryColor, width: 1),
        //           borderRadius: BorderRadius.circular(16)
        //       ),
        //       enabledBorder: OutlineInputBorder(
        //           borderSide: BorderSide(
        //               color: AppColors.primaryColor, width: 1),
        //           borderRadius: BorderRadius.circular(16)
        //       ),
        //       focusedBorder: OutlineInputBorder(
        //           borderSide: BorderSide(
        //               color: AppColors.primaryColor, width: 1),
        //           borderRadius: BorderRadius.circular(16)
        //       ),
        //     ),
        //     dropdownColor: AppColors.white,
        //     style: TextStyle(
        //         color: AppColors.primaryColor, fontWeight: FontWeight.bold),
        //     iconEnabledColor: AppColors.primaryColor,
        //     items: themes.map((theme) {
        //       return DropdownMenuItem(
        //         value: theme,
        //         child: Text(theme),
        //       );
        //     }).toList(),
        //     onChanged: (value) {
        //       setState(() {
        //       });
        //     },
        //   ),
        // ),
        SizedBox(height: 320,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ElevatedButton(
            onPressed: () {
              GoogleSignIn googleSignIn = GoogleSignIn();
              googleSignIn.disconnect();
            },
            style: ElevatedButton.styleFrom(
              // padding: EdgeInsets.symmetric(horizontal: 156,vertical: 16),
              fixedSize: Size(MediaQuery
                  .sizeOf(context)
                  .width, 56),
              backgroundColor: AppColors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
            ),
            child: Row(
              children: [
                Icon(Icons.logout_rounded, size: 24, color: AppColors.white,),
                SizedBox(width: 8,),
                Text(
                  "Logout",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Inter',
                    color: AppColors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Language {
  String code;
  String name;

  Language({required this.name, required this.code});
}
