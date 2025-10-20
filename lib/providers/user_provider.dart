import 'package:evently_application/firebase_service.dart';
import 'package:evently_application/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserModel? currentUser;

  void UpdatCurrentUser(UserModel? user) {
    currentUser = user;
    notifyListeners();
  }

  bool checkIsFavourite(String eventId) {
    if (currentUser == null) return false;
    return currentUser!.favouriteEvents.contains(eventId);
  }

  void addEventFavourite(String eventId) {
    FirebaseService.addEventToFavourite(eventId);
    currentUser!.favouriteEvents.add(eventId);
    notifyListeners();
  }

  void removeEventFavourite(String eventId) {
    FirebaseService.removeEventFromFavourite(eventId);
    currentUser!.favouriteEvents.remove(eventId);
    notifyListeners();
  }
}
