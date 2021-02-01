import 'package:flutter/material.dart';
import 'package:userapp/domain/model/user.dart';
import 'package:userapp/domain/model/user_detail.dart';
import 'package:userapp/domain/repository/api_repository.dart';

class UserBLoC extends ChangeNotifier {
  final ApiRepositoryInterface apiRepositoryInterface;

  UserBLoC({
    this.apiRepositoryInterface,
  }) {
    loadUsers();
  }

  bool _isLoading;
  List<User> _users;
  UserDetail _userDetail;
  bool _isLoadingUserSelected = true;
  int _page = 1;

  bool get isLoading => this._isLoading;
  set isLoading(bool value) {
    this._isLoading = value;
    notifyListeners();
  }

  List<User> get users => this._users;
  set users(List<User> value) {
    this._users = value;
    notifyListeners();
  }

  bool get isLoadingUserSelected => this._isLoadingUserSelected;
  set isLoadingUserSelected(bool value) {
    this._isLoadingUserSelected = value;
    notifyListeners();
  }

  UserDetail get userDetail => this._userDetail;
  set userDetail(UserDetail value) {
    this._userDetail = value;
    notifyListeners();
  }

  int get page => this._page;
  set page(int value) {
    this._page = value;
    notifyListeners();
  }

  Future<void> loadUsers() async {
    this._isLoading = true;
    final List<User> usersResponse =
        await apiRepositoryInterface.getUsers(page);
    this._users = usersResponse;
    this._isLoading = false;
    notifyListeners();
  }

  Future<void> selectUser(int userId) async {
    this._isLoadingUserSelected = true;
    notifyListeners();

    final UserDetail userDetail =
        await apiRepositoryInterface.getUserSelected(userId);
    this._userDetail = userDetail;
    this._isLoadingUserSelected = false;
    notifyListeners();
  }
}
