import 'package:evently_application/core/constants/app_colors.dart';
import 'package:evently_application/taps/home/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      // color: AppColors.primaryColor,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(28),
          bottomLeft: Radius.circular(28),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 16, right: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome Back ✨",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Inter',
                  color: AppColors.white,
                ),
              ),
              Text(
                "User Name",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Inter',
                  color: AppColors.white,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  SvgPicture.asset("assets/icons/map.svg"),
                  SizedBox(width: 10),
                  Text(
                    "Cairo ,Egypt",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Inter',
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              DefaultTabController(
                length: 4,
                child: TabBar(
                  tabAlignment: TabAlignment.start,
                  isScrollable: true,
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent,
                  labelPadding: EdgeInsets.only(right: 10),
                  tabs: [
                    TabItem(
                      label: "All",
                      icon: Icons.all_inclusive_rounded,
                      isSelected: true,
                    ),
                    TabItem(
                      label: "Sport",
                      icon: Icons.sports_basketball,
                      isSelected: false,
                    ),
                    TabItem(
                      label: "Book Club",
                      icon: Icons.menu_book,
                      isSelected: false,
                    ),
                    TabItem(
                      label: "Birthday",
                      icon: Icons.add_alert,
                      isSelected: false,
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
