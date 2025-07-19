import 'package:evently_application/core/constants/app_colors.dart';
import 'package:evently_application/nav_bar_icon.dart';
import 'package:evently_application/taps/home/home_tap.dart';
import 'package:evently_application/taps/love/love_tap.dart';
import 'package:evently_application/taps/map/map_tap.dart';
import 'package:evently_application/taps/profile/profile_tap.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "/home_screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  List<Widget> tabs = [HomeTab(), MapTab(), LoveTab(), ProfileTab()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (currentIndex == index) return;
          setState(() {
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: NavBarIcon(imageName: 'Home'),
            activeIcon: NavBarIcon(imageName: 'Home_active'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: NavBarIcon(imageName: 'map'),
            activeIcon: NavBarIcon(imageName: 'Map_active'),
            label: 'Map',
          ),
          BottomNavigationBarItem(
            icon: NavBarIcon(imageName: 'Heart'),
            activeIcon: NavBarIcon(imageName: 'Heart_active'),
            label: 'Love',
          ),
          BottomNavigationBarItem(
            icon: NavBarIcon(imageName: 'profile'),
            activeIcon: NavBarIcon(imageName: 'profile_active'),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
