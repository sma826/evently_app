import 'package:evently_application/firebase_service.dart';
import 'package:evently_application/models/event_model.dart';
import 'package:evently_application/modules/edit%20screen/edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

import '../../core/constants/app_colors.dart';

class DetailesScreen extends StatefulWidget {
  final EventModel event;

  const DetailesScreen({Key? key, required this.event}) : super(key: key);

  @override
  State<DetailesScreen> createState() => _DetailesScreenState();
}

class _DetailesScreenState extends State<DetailesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.backgroundLight,
        iconTheme: IconThemeData(color: AppColors.primaryColor),
        title: Text(
          "Event Details",
          style: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 22,
            fontWeight: FontWeight.w400,
            fontFamily: 'Inter',
          ),
        ),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () async {
              final updatedEvent = await Navigator.push<EventModel>(
                context,
                MaterialPageRoute(
                  builder: (context) => EditScreen(event: widget.event),
                ),
              );

              if (updatedEvent != null) {
                setState(() {
                  widget.event.tittle = updatedEvent.tittle;
                  widget.event.description = updatedEvent.description;
                  widget.event.dateTime = updatedEvent.dateTime;
                  widget.event.category = updatedEvent.category;
                });
              }
              Navigator.pop(context, widget.event);
            },

            child: Icon(Icons.edit, color: AppColors.primaryColor),
          ),
          SizedBox(width: 8),
          InkWell(
            onTap: () async {
              await FirebaseService.deleteEvent(widget.event.id);
              Navigator.pop(context, widget.event.id);
            },
            child: Icon(Icons.delete_forever_outlined, color: AppColors.red),
          ),
          SizedBox(width: 8),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 16,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.asset(
                "assets/images/${widget.event.category.imageName}.png",
                height: MediaQuery.sizeOf(context).height * 0.23,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
            ),
            Text(
              '${widget.event.tittle}',
              style: TextStyle(
                color: AppColors.primaryColor,
                fontFamily: 'Inter',
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(width: 1, color: AppColors.primaryColor),
              ),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/date-details.svg'),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        DateFormat('d MMMM y').format(widget.event.dateTime),
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontFamily: 'Inter',
                        ),
                      ),
                      Text(
                        DateFormat('h:mm a').format(widget.event.dateTime),
                        style: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(width: 1, color: AppColors.primaryColor),
              ),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/location-details.svg'),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cairo , Egypt',
                        style: TextStyle(
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                          fontFamily: 'Inter',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Text(
              'description',
              style: TextStyle(
                color: AppColors.black,
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '${widget.event.description}',
              style: TextStyle(
                color: AppColors.black,
                fontFamily: 'Inter',
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
