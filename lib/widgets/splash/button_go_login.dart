import 'package:flutter/material.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:provider/provider.dart';
import 'package:userapp/providers/location_provider.dart';

class ButtonGoLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<LocationProvider>(context);

    final Size screenSize = MediaQuery.of(context).size;
    return Container(
        child: RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: screenSize.width * 0.2,
            vertical: screenSize.height * 0.02),
        child: Text(
          'IR A LOGIN',
          style: TextStyle(
              fontSize: screenSize.height * 0.024, fontWeight: FontWeight.w600),
        ),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(screenSize.height)),
      color: Colors.black,
      textColor: Colors.white,
      onPressed: (locationProvider.permissionStatus == PermissionStatus.granted)
          ? () => goToLogin(context)
          : null,
    ));
  }

  goToLogin(BuildContext context) {
    Navigator.pushNamed(context, 'login');
  }
}
