import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/presentation/login/login_bloc.dart';
import 'package:userapp/presentation/widgets/loading_alert.dart';

class SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final LoginBLoC loginBLoC = Provider.of<LoginBLoC>(context);

    return Container(
        margin: EdgeInsets.symmetric(vertical: screenSize.height * 0.04),
        child: RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: screenSize.width * 0.2,
                vertical: screenSize.height * 0.02),
            child: Text(
              'SIGN IN',
              style: TextStyle(
                  wordSpacing: 1,
                  letterSpacing: 1,
                  fontSize: screenSize.height * 0.024,
                  fontWeight: FontWeight.w700),
            ),
          ),
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(screenSize.height)),
          color: Theme.of(context).primaryColor,
          textColor: Colors.white,
          onPressed: (loginBLoC.isOk) ? () => login(loginBLoC, context) : null,
        ));
  }

  void login(LoginBLoC loginBLoC, BuildContext context) async {
    loadingAlert(context);
    final LoginBLoC loginBLoC = Provider.of<LoginBLoC>(context, listen: false);

    // ignore: close_sinks
    loginBLoC.loginUser(context);

    // if (data['token'] != null) {
    //   Navigator.pop(context);
    //   Navigator.pushNamed(context, 'navigation');
    // } else {
    //   Navigator.pop(context);
    //   singleAlert(context, screenSize, 'Aviso', "Credenciales incorrectas.");
    // }
  }
}
