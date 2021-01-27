import 'package:flutter/material.dart';
import 'package:userapp/core/responsive.dart';

class TitleSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
      child: Text(
        "USERAPP",
        style: TextStyle(
            fontSize: responsive.heightR(5),
            fontWeight: FontWeight.w700,
            color: Colors.white),
      ),
    );
  }
}
