// Flutter
import 'package:flutter/material.dart';

// Widgets
import 'package:userapp/widgets/login/signin_button.dart';
import 'package:userapp/widgets/login/signup_info.dart';
import 'package:userapp/widgets/login/textformfields.dart';

class FormLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return Positioned(
      bottom: 0,
      child: Container(
        padding: EdgeInsets.only(
            left: screenSize.width * 0.1,
            right: screenSize.width * 0.1,
            top: screenSize.height * 0.06),
        height: screenSize.height * 0.5,
        width: screenSize.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(screenSize.height * 0.15))),
        child: Column(
          children: [
            TextFormFieldUsername(),
            TextFormFieldPassword(),
            SignInButton(),
            SignUpInfo()
          ],
        ),
      ),
    );
  }
}
