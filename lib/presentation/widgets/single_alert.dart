import 'package:flutter/material.dart';

singleAlert(
    BuildContext context, Size screenSize, String title, String message) {
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: TextStyle(fontWeight: FontWeight.w700),
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(screenSize.height * 0.005)),
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
