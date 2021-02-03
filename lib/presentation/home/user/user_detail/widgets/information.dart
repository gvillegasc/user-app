import 'package:flutter/material.dart';
import 'package:userapp/core/app_strings.dart';
import 'package:userapp/core/app_styles.dart';
import 'package:userapp/domain/model/user_detail.dart';

class Information extends StatelessWidget {
  final UserDetail userDetail;

  const Information({Key key, @required this.userDetail}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final AppStyles appStyles = AppStyles.of(context);

    return Column(
      children: <Widget>[
        Text(
          AppStrings.titleInformation,
          style: appStyles.progressTitle(),
        ),
        Text(userDetail.data.firstName + " " + userDetail.data.lastName,
            style: appStyles.progressBody()),
        Text(userDetail.data.email, style: appStyles.progressBody()),
        SizedBox(
          height: 15,
        )
      ],
    );
  }
}
