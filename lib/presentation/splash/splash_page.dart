import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/core/app_colors.dart';
import 'package:userapp/core/responsive.dart';
import 'package:userapp/injection_container.dart';
import 'package:userapp/presentation/splash/splash_bloc.dart';
import 'package:userapp/presentation/splash/widgets/info.dart';
import 'package:userapp/presentation/splash/widgets/robot_background.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => sl<SplashBLoC>(),
      child: Scaffold(
        backgroundColor: AppColors.yellow50,
        body: Container(
          child: Stack(
            children: [
              ButtonLocation(),
              RobotBackground(),
              Info(),
            ],
          ),
        ),
      ),
    );
  }
}

class ButtonLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final SplashBLoC splashBLoC =
        Provider.of<SplashBLoC>(context, listen: false);
    return Positioned(
      top: responsive.heightR(3),
      right: responsive.heightR(1),
      child: IconButton(
        onPressed: () => splashBLoC.requestPermissions(),
        icon: Icon(Icons.location_on),
      ),
    );
  }
}
