import 'package:evently_application/models/event_model.dart';
import 'package:evently_application/modules/details%20screen/details_screen.dart';
import 'package:evently_application/providers/events_provider.dart';
import 'package:evently_application/taps/home/home_header.dart';
import 'package:evently_application/widgets/event_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    EventsProvider eventsProvider = Provider.of<EventsProvider>(context);
    return Column(
      children: [
        HomeHeader(),
        SizedBox(height: 16),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16),
            itemBuilder:
                (_, index) =>
                GestureDetector(
                  onTap: () async {
                    final updateEvent = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                DetailesScreen(event: eventsProvider
                                    .displayedEvents[index]),
                      ),
                    );
                    if (updateEvent == null) return;

                    if (updateEvent is EventModel) {
                      setState(() {
                        int idx = eventsProvider.displayedEvents.indexWhere((
                            e) =>
                        e.id == updateEvent.id);
                        if (idx != -1)
                          eventsProvider.displayedEvents[idx] = updateEvent;
                      });
                    } else if (updateEvent is String) {
                      setState(() {
                        eventsProvider.displayedEvents.removeWhere((e) =>
                        e.id == updateEvent);
                        eventsProvider.allEvents.removeWhere((e) =>
                        e.id == updateEvent);
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
                  child: EventItem(eventsProvider.displayedEvents[index]),
                ),
            separatorBuilder: (_, _) => SizedBox(height: 16),
            itemCount: eventsProvider.displayedEvents.length,
          ),
        ),
      ],
    );
  }
}
