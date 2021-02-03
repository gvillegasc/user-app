import 'package:flutter/material.dart';
import 'package:userapp/core/app_colors.dart';
import 'package:userapp/core/responsive.dart';

class AppStyles {
  final Responsive responsive;

  AppStyles({@required this.responsive});

  factory AppStyles.of(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return AppStyles(responsive: responsive);
  }

  TextStyle progressBigTitle({Color color = AppColors.black50}) {
    return TextStyle(
        fontSize: this.responsive.inchR(4.5),
        color: color,
        fontWeight: FontWeight.w700);
  }

  TextStyle progressTitle({Color color = AppColors.black50}) {
    return TextStyle(
        fontSize: this.responsive.inchR(2.2),
        color: color,
        fontWeight: FontWeight.w700);
  }

  TextStyle progressSubtitle({Color color = AppColors.black50}) {
    return TextStyle(
        fontSize: this.responsive.inchR(1.75),
        color: color,
        fontWeight: FontWeight.w500);
  }

  TextStyle progressBody(
      {Color color = AppColors.black50,
      FontWeight fontWeight = FontWeight.w500}) {
    return TextStyle(
        fontSize: this.responsive.inchR(1.75),
        color: color,
        fontWeight: fontWeight);
  }

  TextStyle progressSmallText(
      {Color color = AppColors.black50,
      FontWeight fontWeight = FontWeight.w400}) {
    return TextStyle(
        fontSize: this.responsive.inchR(1.5),
        color: color,
        fontWeight: fontWeight);
  }
}
