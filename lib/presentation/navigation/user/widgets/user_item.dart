import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/core/app_colors.dart';
import 'package:userapp/core/responsive.dart';
import 'package:userapp/domain/model/user.dart';
import 'package:userapp/presentation/navigation/user/user_bloc.dart';
import 'package:userapp/presentation/navigation/user/user_detail/user_detail_page.dart';
import 'package:userapp/presentation/routes/routes.dart';

class UserItem extends StatelessWidget {
  final User user;

  const UserItem({Key key, @required this.user})
      : assert(user != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final UserBLoC userBLoC = Provider.of<UserBLoC>(context);
    return FadeIn(
      child: GestureDetector(
        onTap: () {
          userBLoC.selectUser(this.user.id);
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => UserDetailPage(),
              ));

          // Navigator.pushNamed(context, AppRoutes.userDetail);
        },
        child: Container(
          margin: EdgeInsets.only(bottom: 20),
          height: responsive.heightR(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(responsive.heightR(2)),
            color: AppColors.white30,
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  blurRadius: 10.0,
                  offset: Offset(0.0, 0.1))
            ],
          ),
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _UserAvatar(avatar: this.user.avatar),
              _UserInfo(
                email: this.user.email,
                firstName: this.user.lastName,
                lastName: this.user.lastName,
              ),
              _Select()
            ],
          ),
        ),
      ),
    );
  }
}

class _UserAvatar extends StatelessWidget {
  final String avatar;

  const _UserAvatar({Key key, @required this.avatar})
      : assert(avatar != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return ClipRRect(
      borderRadius: BorderRadius.circular(responsive.heightR(2)),
      child: Container(
          height: double.infinity,
          width: responsive.heightR(10),
          decoration: BoxDecoration(
            color: AppColors.grey40,
            borderRadius: BorderRadius.circular(responsive.heightR(2)),
          ),
          child: CachedNetworkImage(
            imageUrl: this.avatar,
          )),
    );
  }
}

class _UserInfo extends StatelessWidget {
  final String email;
  final String firstName;
  final String lastName;

  const _UserInfo({
    Key key,
    @required this.email,
    @required this.firstName,
    @required this.lastName,
  })  : assert(
          email != null,
          firstName != null,
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
      height: responsive.heightR(10),
      width: responsive.widthR(50),
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${this.firstName} ${this.lastName}",
            style: TextStyle(
                fontWeight: FontWeight.w700, fontSize: responsive.heightR(2)),
          ),
          Text(
            this.email,
            style: TextStyle(
                fontWeight: FontWeight.w400, fontSize: responsive.heightR(1.8)),
          ),
        ],
      ),
    );
  }
}

class _Select extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
      alignment: Alignment.center,
      width: responsive.widthR(10),
      height: double.infinity,
      child: Transform.rotate(
        angle: 180 * pi / 180,
        child: Icon(
          CupertinoIcons.back,
          color: AppColors.yellow50,
          size: responsive.heightR(4),
        ),
      ),
    );
  }
}
