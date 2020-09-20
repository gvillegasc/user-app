import 'package:flutter/material.dart';

class DescriptionSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: screenSize.height * 0.04),
      padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.1),
      child: Text(
        "Ea Lorem est ex sint veniam officia aliquip dolore sit eiusmod dolor. Ea Lorem est ex sint veniam officia.",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: screenSize.height * 0.025,
            fontWeight: FontWeight.w500,
            color: Colors.black),
      ),
    );
  }
}
