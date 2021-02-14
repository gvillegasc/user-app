import 'package:flutter/material.dart';
import 'package:userapp/domain/model/user.dart';
import 'package:userapp/domain/model/user_detail.dart';
import 'package:userapp/domain/repository/api_repository.dart';

enum UserState { loading, completed }
enum UserSelectedState { loading, completed }

class UserBLoC extends ChangeNotifier {
  final ApiRepositoryInterface apiRepositoryInterface;

  UserState userState = UserState.loading;
  List<User> users;
  UserDetail userDetail;
  UserSelectedState userSelectedState = UserSelectedState.loading;
  int page = 1;

  UserBLoC({
    this.apiRepositoryInterface,
  }) {
    loadUsers();
  }

  Future<void> loadUsers() async {
    this.userState = UserState.loading;
    final List<User> usersResponse =
        await apiRepositoryInterface.getUsers(page);
    this.users = usersResponse;
    this.userState = UserState.completed;
    notifyListeners();
  }

  Future<void> selectUser(int userId) async {
    this.userSelectedState = UserSelectedState.loading;
    final UserDetail userDetail =
        await apiRepositoryInterface.getUserSelected(userId);
    this.userDetail = userDetail;
    this.userSelectedState = UserSelectedState.completed;
    notifyListeners();
  }
}
