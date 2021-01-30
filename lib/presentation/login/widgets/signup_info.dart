import 'package:flutter/material.dart';
import 'package:userapp/core/app_colors.dart';
import 'package:userapp/core/app_strings.dart';
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
            AppStrings.textDontHaveAccount,
            style: TextStyle(color: AppColors.grey30),
          ),
          Text(AppStrings.actionSignIn,
              style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w700))
        ],
      ),
    );
  }
}
