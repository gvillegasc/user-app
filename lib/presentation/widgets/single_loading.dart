import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:userapp/core/app_colors.dart';

class SingleLoading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: (Platform.isIOS)
          ? CupertinoActivityIndicator()
          : CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(
                AppColors.yellow50,
              ),
            ),
    );
  }
}
