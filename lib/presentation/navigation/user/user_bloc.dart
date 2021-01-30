import 'package:flutter/material.dart';
import 'package:userapp/domain/model/user.dart';
import 'package:userapp/domain/repository/api_repository.dart';

class UserBLoC extends ChangeNotifier {
  final ApiRepositoryInterface apiRepositoryInterface;

  UserBLoC({
    this.apiRepositoryInterface,
  }) {
    loadUsers();
  }

  bool _isLoading = true;
  List<User> _users;
  int _page = 1;

  bool get isLoading => this._isLoading;
  List<User> get users => this._users;
  int get page => this._page;

  Future<void> loadUsers() async {
    this._isLoading = true;
    final List<User> usersResponse =
        await apiRepositoryInterface.getUsers(page);
    this._users = usersResponse;
    this._isLoading = false;
    notifyListeners();
  }
}
