import 'package:flutter/material.dart';
import 'package:location_permissions/location_permissions.dart';

class LocationProvider with ChangeNotifier {
  PermissionStatus _permissionStatus = PermissionStatus.unknown;
  LocationPermissionLevel locationPermission = LocationPermissionLevel.location;

  LocationProvider() {
    this.requestPermission();
  }

  PermissionStatus get permissionStatus => this._permissionStatus;

  set permissionStatus(PermissionStatus value) {
    this._permissionStatus = value;
    notifyListeners();
  }

  requestPermission() async {
    final PermissionStatus permissionRequestResult = await LocationPermissions()
        .requestPermissions(permissionLevel: locationPermission);
    this._permissionStatus = permissionRequestResult;
    notifyListeners();
  }
}
