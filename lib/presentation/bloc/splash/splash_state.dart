part of 'splash_bloc.dart';

@immutable
class SplashState {
  final PermissionStatus permissionStatus;
  final LocationPermissionLevel locationPermission;

  SplashState(
      {this.permissionStatus = PermissionStatus.unknown,
      this.locationPermission = LocationPermissionLevel.location});

  SplashState copyWith(
          {PermissionStatus permissionStatus,
          LocationPermissionLevel locationPermission}) =>
      SplashState(
        permissionStatus: permissionStatus ?? this.permissionStatus,
        locationPermission: locationPermission ?? this.locationPermission,
      );
}
