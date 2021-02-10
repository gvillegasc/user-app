import 'dart:io';

import 'package:flutter/material.dart';
import 'package:userapp/core/app_colors.dart';
import 'package:userapp/core/responsive.dart';

class ArrowButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Positioned(
      top: responsive.heightR(5),
      left: responsive.widthR(4),
      child: IconButton(
        icon: Icon((Platform.isIOS) ? Icons.arrow_back_ios : Icons.arrow_back),
        color: AppColors.white50,
        onPressed: () => Navigator.pop(context),
      ),
    );
  }
}
