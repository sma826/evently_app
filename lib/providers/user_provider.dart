import 'package:evently_application/models/user_model.dart';
import 'package:flutter/material.dart';

class UserProvider with ChangeNotifier {
  UserModel? currentUser;

  void UpdatCurrentUser(UserModel? user) {
    currentUser = user;
    notifyListeners();
  }
}
