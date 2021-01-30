import 'package:flutter/material.dart';
import 'package:userapp/core/responsive.dart';

singleAlert(
    BuildContext context, Responsive responsive, String title, String message) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(responsive.heightR(5))),
          content: Text(message),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Aceptar',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w600),
              ),
              onPressed: () => Navigator.of(context).pop(),
            )
          ],
        );
      });
}
