import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NavBarIcon extends StatelessWidget {
  final String imageName;

  const NavBarIcon({Key? key, required this.imageName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      "assets/icons/$imageName.svg",
      height: 24,
      width: 24,
      fit: BoxFit.scaleDown,
    );
  }
}
