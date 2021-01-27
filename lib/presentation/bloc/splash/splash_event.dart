part of 'splash_bloc.dart';

@immutable
abstract class SplashEvent {}

class OnRequestPermission extends SplashEvent {}

class OnSigninUser extends SplashEvent {
  final String email;
  final String password;
  OnSigninUser(this.email, this.password);
}
