import 'package:flutter/material.dart';
import 'package:userapp/core/responsive.dart';
import 'package:userapp/presentation/splash/widgets/button_go_login.dart';
import 'package:userapp/presentation/splash/widgets/description_splash.dart';
import 'package:userapp/presentation/splash/widgets/title_splash.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Positioned(
      top: responsive.heightR(18),
      child: Container(
        width: responsive.width,
        child: Column(
          children: [TitleSplash(), DescriptionSplash(), ButtonGoLogin()],
        ),
      ),
    );
  }
}
