import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      height: screenSize.height * 0.1,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenSize.height * 0.02),
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
            borderRadius: BorderRadius.circular(screenSize.height * 0.02),
            child: Container(
              height: double.infinity,
              width: screenSize.height * 0.1,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(screenSize.height * 0.02),
              ),
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: AssetImage("assets/pages/images/img_loading.png"),
                image: NetworkImage(this.urlImage),
              ),
            ),
          ),
          Container(
            height: screenSize.height * 0.1,
            width: screenSize.width * 0.5,
            alignment: Alignment.centerLeft,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${this.firstName} ${this.lastName}",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: screenSize.height * 0.02),
                ),
                Text(
                  this.email,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: screenSize.height * 0.018),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: screenSize.width * 0.1,
            height: double.infinity,
            child: Transform.rotate(
              angle: 180 * pi / 180,
              child: IconButton(
                color: Color(0xffFEDD7C),
                icon: Icon(CupertinoIcons.back),
                iconSize: screenSize.height * 0.05,
                onPressed: () {},
              ),
            ),
          )
        ],
      ),
    );
  }
}
