import 'package:flutter/material.dart';
import 'package:userapp/domain/model/user_model.dart';
import 'package:userapp/domain/repository/api_repository.dart';

class UserBLoC extends ChangeNotifier {
  final ApiRepositoryInterface apiRepositoryInterface;

  UserBLoC({
    this.apiRepositoryInterface,
  }) {
    loadUsers();
  }

  bool isLoading;
  List<UserModel> users;
  int page = 1;

  loadUsers() async {
    this.isLoading = true;
    final List<UserModel> usersResponse =
        await apiRepositoryInterface.getUsers(page);
    this.users = usersResponse;
    this.isLoading = false;
    notifyListeners();
  }
}
