import 'dart:math';

import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:userapp/core/responsive.dart';

class UserItem extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String urlImage;
  final String email;

  const UserItem(
      {Key key,
      @required this.firstName,
      @required this.lastName,
      @required this.urlImage,
      @required this.email})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);

    return FadeIn(
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        height: responsive.heightR(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(responsive.heightR(2)),
          color: Color(0xffFFF4D6),
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
            ClipRRect(
              borderRadius: BorderRadius.circular(responsive.heightR(2)),
              child: Container(
                  height: double.infinity,
                  width: responsive.heightR(10),
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(responsive.heightR(2)),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: this.urlImage,
                  )),
            ),
            Container(
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
                        fontWeight: FontWeight.w700,
                        fontSize: responsive.heightR(2)),
                  ),
                  Text(
                    this.email,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: responsive.heightR(1.8)),
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: responsive.widthR(10),
              height: double.infinity,
              child: Transform.rotate(
                angle: 180 * pi / 180,
                child: IconButton(
                  color: Color(0xffFEDD7C),
                  icon: Icon(CupertinoIcons.back),
                  iconSize: responsive.heightR(5),
                  onPressed: () {},
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
