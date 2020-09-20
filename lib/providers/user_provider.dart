import 'package:flutter/material.dart';
import 'package:userapp/models/user_model.dart';
import 'package:userapp/services/user_service.dart';

final userService = new UserService();

class UserProvider with ChangeNotifier {
  List<UserModel> users = [];
  int _page = 1;
  bool _isLoading = true;

  // Constructor
  UserProvider() {
    this.getUsers(this._page);
  }

  // Getters
  bool get isLoading => this._isLoading;

  // Functions
  getUsers(int page) async {
    this._isLoading = true;
    final users = await userService.listUsers(page);
    this.users.addAll(users);
    this._isLoading = false;

    notifyListeners();
  }
}