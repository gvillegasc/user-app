import 'package:flutter/material.dart';
import 'package:userapp/core/app_colors.dart';
import 'package:userapp/core/app_strings.dart';
import 'package:userapp/core/app_styles.dart';

class TitleSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AppStyles appStyles = AppStyles.of(context);
    return Container(
      child: Text(
        AppStrings.titleSplash,
        style: appStyles.progressBigTitle(color: AppColors.white50),
      ),
    );
  }
}
