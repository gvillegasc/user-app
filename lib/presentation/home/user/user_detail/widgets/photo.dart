import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:userapp/core/responsive.dart';
import 'package:userapp/domain/model/user_detail.dart';

class Photo extends StatelessWidget {
  final UserDetail userDetail;

  const Photo({Key key, @required this.userDetail}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Container(
      margin: EdgeInsets.symmetric(vertical: responsive.heightR(5)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(responsive.inchR(50)),
        child: Container(
          decoration: BoxDecoration(shape: BoxShape.circle),
          height: responsive.heightR(15),
          width: responsive.heightR(15),
          child: CachedNetworkImage(
            imageUrl: userDetail.data.avatar,
          ),
        ),
      ),
    );
  }
}
