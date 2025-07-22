import 'package:evently_application/taps/home/home_header.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeHeader(),
      ],
    );
  }
}
