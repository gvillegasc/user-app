import 'package:flutter/material.dart';
import 'package:userapp/core/responsive.dart';

class ImageRobot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Positioned(
      top: responsive.heightR(7),
      child: Container(
        width: responsive.width,
        height: responsive.heightR(50),
        alignment: Alignment.center,
        child: Image(
          image: AssetImage("assets/pages/images/img_robot.png"),
          height: responsive.heightR(50),
        ),
      ),
    );
  }
}
