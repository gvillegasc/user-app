import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/core/responsive.dart';
import 'package:userapp/injection_container.dart';
import 'package:userapp/presentation/bloc/splash/splash_bloc.dart';
import 'package:userapp/presentation/splash/widgets/info.dart';
import 'package:userapp/presentation/splash/widgets/robot_background.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return BlocProvider(
      create: (_) => sl<SplashBloc>(),
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Container(
          height: responsive.height,
          width: responsive.width,
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

    // ignore: close_sinks
    final SplashBloc splashBloc =
        BlocProvider.of<SplashBloc>(context, listen: false);
    return Positioned(
      top: responsive.heightR(3),
      right: responsive.heightR(1),
      child: IconButton(
        onPressed: () => splashBloc.add(OnRequestPermission()),
        icon: Icon(Icons.location_on),
      ),
    );
  }
}
