import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:userapp/core/responsive.dart';
import 'package:userapp/presentation/login/login_bloc.dart';

class TextFormFieldUsername extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginBLoC loginBLoC = Provider.of<LoginBLoC>(context);
    final Responsive responsive = Responsive.of(context);
    return Container(
      margin: EdgeInsets.only(
        bottom: responsive.heightR(.15),
      ),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          loginBLoC.usernameController = value;
        },
        autocorrect: false,
        decoration: InputDecoration(
            errorText: loginBLoC.usernameError,
            hintText: "Username",
            hintStyle: TextStyle(fontWeight: FontWeight.w500),
            icon: Icon(
              FontAwesomeIcons.userAlt,
              color: Theme.of(context).primaryColor,
            )),
      ),
    );
  }
}

class TextFormFieldPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginBLoC loginBLoC = Provider.of<LoginBLoC>(context);
    final Responsive responsive = Responsive.of(context);

    return Container(
      margin: EdgeInsets.only(
        bottom: responsive.heightR(.15),
      ),
      child: TextField(
        obscureText: true,
        keyboardType: TextInputType.text,
        onChanged: (value) {
          loginBLoC.passwordController = value;
        },
        autocorrect: false,
        decoration: InputDecoration(
            errorText: loginBLoC.passwordError,
            hintText: "Password",
            hintStyle: TextStyle(fontWeight: FontWeight.w500),
            icon: Icon(
              FontAwesomeIcons.lock,
              color: Theme.of(context).primaryColor,
            )),
      ),
    );
  }
}
