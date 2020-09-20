// Flutter
import 'package:flutter/material.dart';

// Providers
import 'package:provider/provider.dart';
import 'package:userapp/providers/form_provider.dart';

// Services
import 'package:userapp/services/user_service.dart';

// Utils
import 'package:userapp/utils/widgets.dart';

final userService = new UserService();

class SignInButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final formProvider = Provider.of<FormProvider>(context);

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
          onPressed:
              (formProvider.isOk) ? () => login(formProvider, context) : null,
        ));
  }

  void login(FormProvider formProvider, BuildContext context) async {
    final Size screenSize = MediaQuery.of(context).size;
    loading(context);
    final data = await userService.loginUser(
      formProvider.usernameController,
      formProvider.usernameController,
    );
    if (data['token'] != null) {
      Navigator.pop(context);
      Navigator.pushNamed(context, 'navigation');
    } else {
      Navigator.pop(context);
      infoAlert(context, screenSize, 'Aviso', "Credenciales incorrectas.");
    }
  }
}
