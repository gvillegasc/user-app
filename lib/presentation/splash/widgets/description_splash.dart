import 'package:flutter/material.dart';
import 'package:userapp/core/responsive.dart';

class DescriptionSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: responsive.heightR(5)),
      padding: EdgeInsets.symmetric(horizontal: responsive.widthR(10)),
      child: Text(
        "Ea Lorem est ex sint veniam officia aliquip dolore sit eiusmod dolor. Ea Lorem est ex sint veniam officia.",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: responsive.heightR(2.3),
            fontWeight: FontWeight.w500,
            color: Colors.black),
      ),
    );
  }
}
