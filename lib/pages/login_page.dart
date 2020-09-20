import 'package:flutter/material.dart';

// Providers
import 'package:provider/provider.dart';
import 'package:userapp/providers/form_provider.dart';

// Widgets
import 'package:userapp/widgets/login/form_login.dart';
import 'package:userapp/widgets/login/image_robot.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (_) => FormProvider(),
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Container(
            height: screenSize.height,
            width: screenSize.width,
            child: Stack(
              children: [FormLogin(), ImageRobot()],
            ),
          ),
        ),
      ),
    );
  }
}
