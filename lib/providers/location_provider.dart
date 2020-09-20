import 'package:flutter/material.dart';
import 'package:location_permissions/location_permissions.dart';

class LocationProvider with ChangeNotifier {
  PermissionStatus _permissionStatus = PermissionStatus.unknown;
  LocationPermissionLevel locationPermission = LocationPermissionLevel.location;

  // Constructor
  LocationProvider() {
    this.requestPermission();
  }

  // Getters
  PermissionStatus get permissionStatus => this._permissionStatus;

  // Setters
  set permissionStatus(PermissionStatus value) {
    this._permissionStatus = value;
    notifyListeners();
  }

  // Functions
  requestPermission() async {
    final PermissionStatus permissionRequestResult = await LocationPermissions()
        .requestPermissions(permissionLevel: locationPermission);
    this._permissionStatus = permissionRequestResult;

    notifyListeners();
  }
}
