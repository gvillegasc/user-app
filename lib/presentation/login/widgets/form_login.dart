import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:userapp/core/responsive.dart';
import 'package:userapp/presentation/login/login_bloc.dart';
import 'package:userapp/presentation/login/widgets/signin_button.dart';
import 'package:userapp/presentation/login/widgets/signup_info.dart';
import 'package:userapp/presentation/login/widgets/input_text_form_field.dart';

class FormLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final LoginBLoC loginBLoC = Provider.of<LoginBLoC>(context);
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
            InputTextFormField(
              errorText: loginBLoC.usernameError,
              hintText: 'Username',
              iconData: FontAwesomeIcons.userAlt,
              textEditingController: loginBLoC.usernameController,
              onChanged: loginBLoC.onChangeUsername,
              textInputType: TextInputType.emailAddress,
            ),
            InputTextFormField(
              errorText: loginBLoC.passwordError,
              hintText: 'Password',
              iconData: FontAwesomeIcons.lock,
              textEditingController: loginBLoC.passwordController,
              obscureText: true,
              onChanged: loginBLoC.onChangePassword,
            ),
            SignInButton(),
            SignUpInfo()
          ],
        ),
      ),
    );
  }
}
