import 'package:flutter/material.dart';
import 'package:userapp/core/responsive.dart';

class RobotBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Positioned(
      bottom: -responsive.heightR(45),
      child: Container(
        height: responsive.height,
        width: responsive.width,
        child: Image(
          fit: BoxFit.cover,
          image: AssetImage("assets/pages/images/img_robot.png"),
        ),
      ),
    );
  }
}
