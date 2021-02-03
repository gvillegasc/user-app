import 'package:flutter/material.dart';
import 'package:userapp/domain/model/user.dart';
import 'package:userapp/domain/model/user_detail.dart';
import 'package:userapp/domain/repository/api_repository.dart';

enum UserState { loading, completed }
enum UserSelectedState { loading, completed }

class UserBLoC extends ChangeNotifier {
  final ApiRepositoryInterface apiRepositoryInterface;

  UserBLoC({
    this.apiRepositoryInterface,
  }) {
    loadUsers();
  }

  UserState _userState = UserState.loading;
  List<User> _users;
  UserDetail _userDetail;
  UserSelectedState _userSelectedState = UserSelectedState.loading;
  int _page = 1;

  UserState get userState => this._userState;
  set userState(UserState value) {
    this._userState = value;
    notifyListeners();
  }

  List<User> get users => this._users;
  set users(List<User> value) {
    this._users = value;
    notifyListeners();
  }

  UserSelectedState get userSelectedState => this._userSelectedState;
  set userSelectedState(UserSelectedState value) {
    this._userSelectedState = value;
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
    this._userState = UserState.loading;
    final List<User> usersResponse =
        await apiRepositoryInterface.getUsers(page);
    this._users = usersResponse;
    this._userState = UserState.completed;
    notifyListeners();
  }

  Future<void> selectUser(int userId) async {
    this._userSelectedState = UserSelectedState.loading;
    final UserDetail userDetail =
        await apiRepositoryInterface.getUserSelected(userId);
    this._userDetail = userDetail;
    this._userSelectedState = UserSelectedState.completed;
    notifyListeners();
  }
}
