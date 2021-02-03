import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/core/app_colors.dart';
import 'package:userapp/core/app_strings.dart';
import 'package:userapp/core/responsive.dart';
import 'package:userapp/presentation/login/login_bloc.dart';
import 'package:userapp/presentation/routes/routes.dart';
import 'package:userapp/presentation/widgets/loading_alert.dart';
import 'package:userapp/presentation/widgets/single_alert.dart';

class SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginBLoC loginBLoC = Provider.of<LoginBLoC>(context);
    final Responsive responsive = Responsive.of(context);
    return Container(
        margin: EdgeInsets.symmetric(vertical: responsive.heightR(4)),
        child: RaisedButton(
          child: Container(
            padding: EdgeInsets.symmetric(
                horizontal: responsive.widthR(20),
                vertical: responsive.heightR(2)),
            child: Text(
              AppStrings.actionSignIn,
              style: TextStyle(
                  wordSpacing: 1,
                  letterSpacing: 1,
                  fontSize: responsive.heightR(2.5),
                  fontWeight: FontWeight.w700),
            ),
          ),
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(responsive.height)),
          color: AppColors.yellow50,
          textColor: AppColors.white50,
          onPressed: (loginBLoC.loginState == LoginState.valid)
              ? () => login(loginBLoC, context)
              : null,
        ));
  }

  void login(LoginBLoC loginBLoC, BuildContext context) async {
    loadingAlert(context);
    final Responsive responsive = Responsive.of(context);
    final LoginBLoC loginBLoC = Provider.of<LoginBLoC>(context, listen: false);

    final bool isLogged = await loginBLoC.loginUser();
    Navigator.pop(context);

    if (isLogged) {
      Navigator.pushNamed(context, AppRoutes.navigation);
    } else {
      singleAlert(context, responsive, 'Aviso', "Credenciales incorrectas.");
    }
  }
}
