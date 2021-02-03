import 'package:flutter/material.dart';
import 'package:userapp/core/app_colors.dart';
import 'package:userapp/core/app_strings.dart';
import 'package:userapp/core/app_styles.dart';
import 'package:userapp/core/responsive.dart';

class SignUpInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final AppStyles appStyles = AppStyles.of(context);
    return Container(
      width: responsive.width,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            AppStrings.textDontHaveAccount,
            style: appStyles.progressBody(color: AppColors.grey40),
          ),
          Text(AppStrings.actionSignIn,
              style: appStyles.progressBody(
                  color: AppColors.yellow50, fontWeight: FontWeight.w700))
        ],
      ),
    );
  }
}
