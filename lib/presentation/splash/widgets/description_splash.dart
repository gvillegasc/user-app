import 'package:flutter/material.dart';
import 'package:userapp/core/app_strings.dart';
import 'package:userapp/core/responsive.dart';

class DescriptionSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: responsive.heightR(5)),
      padding: EdgeInsets.symmetric(horizontal: responsive.widthR(10)),
      child: Text(
        AppStrings.descriptionSplash,
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: responsive.heightR(2.3),
            fontWeight: FontWeight.w500,
            color: Colors.black),
      ),
    );
  }
}
