import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:userapp/injection_container.dart';
import 'package:userapp/presentation/bloc/user/user_bloc.dart';
import 'package:userapp/presentation/login/widgets/form_login.dart';
import 'package:userapp/presentation/login/widgets/image_robot.dart';

import 'login_provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return BlocProvider(
      create: (_) => sl<UserBloc>(),
      child: ChangeNotifierProvider(
        create: (_) => LoginProvider(),
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
      ),
    );
  }
}
