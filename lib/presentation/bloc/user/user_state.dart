part of 'user_bloc.dart';

@immutable
class UserState {
  final bool isLoading;
  final List<UserModel> users;
  final int page;

  UserState({this.isLoading = true, this.users, this.page = 1});

  UserState copyWith({bool isLoading, List<UserModel> users, int page}) =>
      UserState(
          isLoading: isLoading ?? this.isLoading,
          users: users ?? this.users,
          page: page ?? this.page);
}
