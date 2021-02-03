import 'package:flutter/material.dart';
import 'package:userapp/core/app_strings.dart';
import 'package:userapp/core/app_styles.dart';
import 'package:userapp/core/responsive.dart';

class DescriptionSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final AppStyles appStyles = AppStyles.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: responsive.heightR(5)),
      padding: EdgeInsets.symmetric(horizontal: responsive.widthR(10)),
      child: Text(AppStrings.descriptionSplash,
          textAlign: TextAlign.center, style: appStyles.progressBody()),
    );
  }
}
