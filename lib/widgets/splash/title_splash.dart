import 'package:flutter/material.dart';

class TitleSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      child: Text(
        "USERAPP",
        style: TextStyle(
            fontSize: screenSize.height * 0.05,
            fontWeight: FontWeight.w700,
            color: Colors.white),
      ),
    );
  }
}
