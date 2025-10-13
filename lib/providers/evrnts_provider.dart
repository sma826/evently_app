import 'package:flutter/material.dart';

import '../firebase_service.dart';
import '../models/category_data_model.dart';
import '../models/event_model.dart';

class EventsProvider with ChangeNotifier {
  List<EventModel> allEvents = [];
  List<EventModel> displayedEvents = [];
  List<EventModel> favouriteEvents = [];

  Future<void> getEvents() async {
    allEvents = await FirebaseService.getEvent();
    displayedEvents = allEvents;
    notifyListeners();
  }

  void filterEvents(CategoryModel? category) {
    if (category == null) {
      displayedEvents = allEvents;
    } else {
      displayedEvents =
          allEvents.where((event) => event.category == category).toList();
    }
    notifyListeners();
  }

  void filterFavouriteEvents(List<String> favouriteIds) {
    favouriteEvents =
        allEvents.where((event) => favouriteIds.contains(event.id)).toList();
    notifyListeners();
  }
}
