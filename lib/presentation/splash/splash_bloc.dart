import 'package:flutter/material.dart';
import 'package:location_permissions/location_permissions.dart';

class SplashBLoC extends ChangeNotifier {
  // PermissionStatus permissionStatus = PermissionStatus.unknown;
  PermissionStatus permissionStatus = PermissionStatus.granted;
  final LocationPermissionLevel locationPermission =
      LocationPermissionLevel.location;

  SplashBLoC() {
    // requestPermissions();
  }

  void requestPermissions() async {
    final PermissionStatus permissionRequestResult = await LocationPermissions()
        .requestPermissions(permissionLevel: this.locationPermission);
    this.permissionStatus = permissionRequestResult;
    notifyListeners();
  }
}
