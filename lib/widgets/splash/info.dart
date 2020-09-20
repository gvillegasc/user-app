import 'package:flutter/material.dart';

// Widgets
import 'package:userapp/widgets/splash/button_go_login.dart';
import 'package:userapp/widgets/splash/description_splash.dart';
import 'package:userapp/widgets/splash/title_splash.dart';

class Info extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Positioned(
      top: screenSize.height * 0.18,
      child: Container(
        width: screenSize.width,
        child: Column(
          children: [TitleSplash(), DescriptionSplash(), ButtonGoLogin()],
        ),
      ),
    );
  }
}
