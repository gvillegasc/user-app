import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:userapp/core/app_colors.dart';
import 'package:userapp/core/responsive.dart';
import 'package:userapp/domain/model/user_detail.dart';

class Photo extends StatelessWidget {
  final UserDetail userDetail;

  const Photo({Key key, @required this.userDetail}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
      height: responsive.heightR(25),
      color: AppColors.yellow50,
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(responsive.inchR(50)),
            child: Container(
              height: responsive.heightR(15),
              width: responsive.heightR(15),
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl: userDetail.data.avatar,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
