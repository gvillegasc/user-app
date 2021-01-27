import 'package:flutter/material.dart';
import 'package:userapp/core/responsive.dart';
import 'package:userapp/presentation/login/widgets/signin_button.dart';
import 'package:userapp/presentation/login/widgets/signup_info.dart';
import 'package:userapp/presentation/login/widgets/text_form_fields.dart';

class FormLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Positioned(
      bottom: 0,
      child: Container(
        padding: EdgeInsets.only(
            left: responsive.widthR(10),
            right: responsive.widthR(10),
            top: responsive.heightR(7)),
        height: responsive.heightR(50),
        width: responsive.width,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(responsive.heightR(15)))),
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
