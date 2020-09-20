import 'package:flutter/material.dart';

class ImageRobot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Positioned(
      top: screenSize.height * 0.07,
      child: Container(
        width: screenSize.width,
        height: screenSize.height * 0.5,
        alignment: Alignment.center,
        child: Image(
          image: AssetImage("assets/images/robot.png"),
          height: screenSize.height * 0.5,
        ),
      ),
    );
  }
}
