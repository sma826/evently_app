import 'package:evently_application/firebase_service.dart';
import 'package:evently_application/models/category_data_model.dart';
import 'package:evently_application/models/event_model.dart';
import 'package:evently_application/modules/details%20screen/details_screen.dart';
import 'package:evently_application/taps/home/home_header.dart';
import 'package:evently_application/widgets/event_item.dart';
import 'package:flutter/material.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  List<EventModel> allEvents = [];
  List<EventModel> displayedEvents = [];

  @override
  void initState() {
    super.initState();
    getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeHeader(filterEvents: filterEvents),
        SizedBox(height: 16),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemBuilder:
                (_, index) => GestureDetector(
                  onTap: () async {
                    final updateEvent = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                DetailesScreen(event: displayedEvents[index]),
                      ),
                    );
                    if (updateEvent == null) return;

                    if (updateEvent is EventModel) {
                      setState(() {
                        int idx = displayedEvents.indexWhere(
                          (e) => e.id == updateEvent.id,
                        );
                        if (idx != -1) displayedEvents[idx] = updateEvent;
                      });
                    } else if (updateEvent is String) {
                      setState(() {
                        displayedEvents.removeWhere((e) => e.id == updateEvent);
                        allEvents.removeWhere((e) => e.id == updateEvent);
                      });
                    }
                    // if (updateEvent != null) {
                    //   setState(() {
                    //     int idx = displayedEvents.indexWhere(
                    //       (e) => e.id == updateEvent.id,
                    //     );
                    //     if (idx != -1) {
                    //       displayedEvents[idx] = updateEvent;
                    //     }
                    //   });
                    // } else {
                    //   displayedEvents.removeWhere(
                    //     (e) => e.id == displayedEvents[index].id,
                    //   );
                    //   setState(() {});
                    // }
                  },
                  child: EventItem(displayedEvents[index]),
                ),
            separatorBuilder: (_, _) => SizedBox(height: 16),
            itemCount: displayedEvents.length,
          ),
        ),
      ],
    );
  }

  Future<void> getEvents() async {
    allEvents = await FirebaseService.getEvent();
    displayedEvents = allEvents;
    setState(() {});
  }

  void filterEvents(CategoryModel? category) {
    if (category == null) {
      displayedEvents = allEvents;
    } else {
      displayedEvents =
          allEvents.where((event) => event.category == category).toList();
    }
    setState(() {});
  }
}
