import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:userapp/domain/repository/api_repository.dart';
import 'package:userapp/injection_container.dart';
import 'package:userapp/presentation/bloc/splash/splash_bloc.dart';
import 'package:userapp/presentation/bloc/user/user_bloc.dart';
import 'package:userapp/presentation/login/login_provider.dart';
import 'package:userapp/presentation/widgets/loading_alert.dart';
import 'package:userapp/presentation/widgets/single_alert.dart';

class SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final loginProvider = Provider.of<LoginProvider>(context);
    final UserBloc userBloc = BlocProvider.of<UserBloc>(context);

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
          onPressed: (loginProvider.isOk)
              ? () => login(loginProvider, context, userBloc)
              : null,
        ));
  }

  void login(
      LoginProvider loginProvider, BuildContext context, userBloc) async {
    loadingAlert(context);

    // ignore: close_sinks

    userBloc.add(OnSignInUser(loginProvider.usernameController,
        loginProvider.usernameController, context));

    // if (data['token'] != null) {
    //   Navigator.pop(context);
    //   Navigator.pushNamed(context, 'navigation');
    // } else {
    //   Navigator.pop(context);
    //   singleAlert(context, screenSize, 'Aviso', "Credenciales incorrectas.");
    // }
  }
}
