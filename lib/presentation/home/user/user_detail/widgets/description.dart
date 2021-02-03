import 'package:flutter/material.dart';
import 'package:userapp/core/app_colors.dart';
import 'package:userapp/core/app_strings.dart';
import 'package:userapp/core/app_styles.dart';
import 'package:userapp/core/responsive.dart';
import 'package:userapp/domain/model/user_detail.dart';

class Description extends StatelessWidget {
  final UserDetail userDetail;

  const Description({Key key, @required this.userDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final AppStyles appStyles = AppStyles.of(context);

    return Column(
      children: <Widget>[
        Text(
          AppStrings.titleDescription,
          style: appStyles.progressTitle(),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: responsive.widthR(10)),
          child: Text(userDetail.support.text,
              textAlign: TextAlign.center, style: appStyles.progressBody()),
        ),
        SizedBox(
          height: responsive.heightR(2),
        ),
        Text(userDetail.support.url,
            textAlign: TextAlign.center,
            style: appStyles.progressBody(color: AppColors.yellow50)),
      ],
    );
  }
}
