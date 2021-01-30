import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/core/responsive.dart';
import 'package:userapp/injection_container.dart';
import 'package:userapp/presentation/login/login_bloc.dart';
import 'package:userapp/presentation/login/widgets/form_login.dart';
import 'package:userapp/presentation/login/widgets/image_robot.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return ChangeNotifierProvider(
      create: (_) => sl<LoginBLoC>(),
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Container(
            height: responsive.height,
            width: responsive.width,
            child: Stack(
              children: [FormLogin(), ImageRobot()],
            ),
          ),
        ),
      ),
    );
  }
}
