import 'package:flutter/material.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:provider/provider.dart';
import 'package:userapp/core/app_strings.dart';
import 'package:userapp/core/responsive.dart';
import 'package:userapp/presentation/routes/routes.dart';
import 'package:userapp/presentation/splash/splash_bloc.dart';

class ButtonGoLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final SplashBLoC splashBLoC = Provider.of<SplashBLoC>(context);
    return Container(
        child: RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: responsive.widthR(20), vertical: responsive.heightR(2)),
        child: Text(
          AppStrings.actionGoToLogin,
          style: TextStyle(
              fontSize: responsive.heightR(2.5), fontWeight: FontWeight.w600),
        ),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(responsive.height)),
      color: Colors.black,
      textColor: Colors.white,
      onPressed: (splashBLoC.permissionStatus == PermissionStatus.granted)
          ? () => Navigator.pushNamed(context, AppRoutes.login)
          : null,
    ));
  }
}
