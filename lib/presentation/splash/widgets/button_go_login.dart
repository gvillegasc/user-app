import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:userapp/presentation/bloc/splash/splash_bloc.dart';
import 'package:userapp/routes/routes.dart';

class ButtonGoLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return BlocBuilder<SplashBloc, SplashState>(
      builder: (_, state) {
        return Container(
            child: RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.2,
                vertical: screenSize.height * 0.02),
            child: Text(
              'IR A LOGIN',
              style: TextStyle(
                  fontSize: screenSize.height * 0.024,
                  fontWeight: FontWeight.w600),
            ),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(screenSize.height)),
          color: Colors.black,
          textColor: Colors.white,
          onPressed: (state.permissionStatus == PermissionStatus.granted)
              ? () => Navigator.pushNamed(context, AppRoutes.login)
              : null,
        ));
      },
    );
  }
}
