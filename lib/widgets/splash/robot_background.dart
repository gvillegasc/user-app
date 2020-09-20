import 'package:flutter/material.dart';

class RobotBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Positioned(
      bottom: -screenSize.height * 0.5,
      child: Container(
        height: screenSize.height,
        width: screenSize.width,
        child: Image(
          fit: BoxFit.cover,
          image: AssetImage("assets/images/robot.png"),
        ),
      ),
    );
  }
}
