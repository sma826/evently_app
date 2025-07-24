import 'package:evently_application/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class TabItemEventScreen extends StatelessWidget {
  String label;
  IconData icon;
  bool isSelected;
  Color unSelectedBackgroundColor = AppColors.white;
  Color selectedBackgroundColor = AppColors.primaryColor;

  TabItemEventScreen({
    super.key,
    required this.label,
    // required this.unSelectedBackgroundColor,
    // required this.selectedBackgroundColor,
    required this.icon,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? selectedBackgroundColor : unSelectedBackgroundColor,
        borderRadius: BorderRadius.circular(46),
        border: Border.all(color: selectedBackgroundColor, width: 1),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 24,
            color:
                isSelected
                    ? unSelectedBackgroundColor
                    : selectedBackgroundColor,
          ),
          SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color:
                  isSelected
                      ? unSelectedBackgroundColor
                      : selectedBackgroundColor,
            ),
          ),
        ],
      ),
    );
  }
}
