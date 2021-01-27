import 'package:flutter/material.dart';
import 'package:userapp/core/responsive.dart';

class SignUpInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
      width: responsive.width,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account? ",
            style: TextStyle(color: Color(0xff999999)),
          ),
          Text(" SIGN UP",
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w700))
        ],
      ),
    );
  }
}
