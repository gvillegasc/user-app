import 'package:flutter/material.dart';
import 'package:userapp/domain/model/user_detail.dart';
import 'package:userapp/presentation/home/user/user_detail/widgets/description.dart';
import 'package:userapp/presentation/home/user/user_detail/widgets/information.dart';
import 'package:userapp/presentation/home/user/user_detail/widgets/photo.dart';

class Detail extends StatelessWidget {
  final UserDetail userDetail;

  const Detail({Key key, @required this.userDetail}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Photo(userDetail: userDetail),
          Information(
            userDetail: userDetail,
          ),
          Description(
            userDetail: userDetail,
          )
        ],
      ),
    );
  }
}
