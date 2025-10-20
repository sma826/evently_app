import 'package:evently_application/core/constants/app_colors.dart';
import 'package:evently_application/models/event_model.dart';
import 'package:evently_application/providers/events_provider.dart';
import 'package:evently_application/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart' show Provider;

import '../providers/settings_provider.dart' show SettingsProvider;

class EventItem extends StatelessWidget {
  EventModel event;

  EventItem(this.event);

  @override
  Widget build(BuildContext context) {
    UserProvider userProvider = Provider.of<UserProvider>(context);
    if (userProvider.currentUser == null) {
      return const Center(child: CircularProgressIndicator());
    }
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    bool isFavourite = userProvider.checkIsFavourite(event.id);
    Size screenSize = MediaQuery.sizeOf(context);

    return Container(
      decoration: BoxDecoration(
        border:
            settingsProvider.isDark
                ? Border.all(color: AppColors.primaryColor)
                : null,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
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
              color:
                  settingsProvider.isDark
                      ? AppColors.backgroundDark
                      : AppColors.white,
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
                color:
                    settingsProvider.isDark
                        ? AppColors.backgroundDark
                        : AppColors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      event.tittle,
                      style: TextStyle(
                        color:
                            settingsProvider.isDark
                                ? AppColors.white
                                : AppColors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'Inter',
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (isFavourite) {
                        userProvider.removeEventFavourite(event.id);
                        Provider.of<EventsProvider>(
                          context,
                          listen: false,
                        ).filterFavouriteEvents(
                          userProvider.currentUser!.favouriteEvents,
                        );
                      } else {
                        userProvider.addEventFavourite(event.id);
                      }
                    },
                    icon: Icon(
                      isFavourite
                          ? Icons.favorite_rounded
                          : Icons.favorite_border_rounded,
                      size: 24,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
