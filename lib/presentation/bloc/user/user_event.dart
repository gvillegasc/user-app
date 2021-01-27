part of 'user_bloc.dart';

@immutable
abstract class UserEvent {}

class OnLoadUsers extends UserEvent {}

class OnSignInUser extends UserEvent {
  final String email;
  final String password;
  final BuildContext context;
  OnSignInUser(this.email, this.password, this.context);
}
