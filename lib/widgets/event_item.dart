import 'package:evently_application/core/constants/app_colors.dart';
import 'package:evently_application/models/event_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventItem extends StatelessWidget {
  EventModel event;

  EventItem(this.event);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);

    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(
            "assets/images/${event.category.imageName}.png",
            height: screenSize.height * 0.23,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          margin: EdgeInsets.all(8),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Text(
                '${event.dateTime.day}',
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Inter',
                ),
              ),
              Text(
                DateFormat('MMM').format(event.dateTime),
                style: TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Inter',
                ),
              ),
            ],
          ),
        ),
        Positioned(
          // width: screenSize.width,
          left: 8,
          right: 8,
          bottom: 8,
          child: Container(
            // margin: EdgeInsets.symmetric(horizontal: 8),
            padding: EdgeInsets.only(left: 8),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    event.tittle,
                    style: TextStyle(
                      color: AppColors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                      fontFamily: 'Inter',
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_rounded,
                    size: 24,
                    color: AppColors.primaryColor,
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
