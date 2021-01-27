import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:userapp/core/responsive.dart';
import 'package:userapp/presentation/login/login_provider.dart';

class TextFormFieldUsername extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final formProvider = Provider.of<LoginProvider>(context);
    final Responsive responsive = Responsive.of(context);
    return Container(
      margin: EdgeInsets.only(
        bottom: responsive.heightR(.15),
      ),
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          formProvider.usernameController = value;
        },
        autocorrect: false,
        decoration: InputDecoration(
            errorText: formProvider.usernameError,
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
    final formProvider = Provider.of<LoginProvider>(context);
    final Responsive responsive = Responsive.of(context);

    return Container(
      margin: EdgeInsets.only(
        bottom: responsive.heightR(.15),
      ),
      child: TextField(
        obscureText: true,
        keyboardType: TextInputType.text,
        onChanged: (value) {
          formProvider.passwordController = value;
        },
        autocorrect: false,
        decoration: InputDecoration(
            errorText: formProvider.passwordError,
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
