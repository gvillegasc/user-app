import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:userapp/core/app_colors.dart';
import 'package:userapp/core/app_strings.dart';
import 'package:userapp/presentation/home/home_bloc.dart';

class TopNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NavigationBLoC navigationBLoC = Provider.of<NavigationBLoC>(context);
    final double statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.white50,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10.0,
              offset: Offset(0.0, 0.1))
        ],
      ),
      padding: EdgeInsets.only(top: statusBarHeight),
      child: BubbleBottomBar(
        opacity: 1,
        backgroundColor: AppColors.white50,
        currentIndex: navigationBLoC.actualPage,
        onTap: (i) => navigationBLoC.changePage(i),
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
        elevation: 0,
        hasNotch: false,
        hasInk: true,
        items: <BubbleBottomBarItem>[
          navigationItem(
            FontAwesomeIcons.list,
            AppStrings.titleContact,
          ),
          navigationItem(
            FontAwesomeIcons.comment,
            AppStrings.titleChats,
          ),
          navigationItem(
            FontAwesomeIcons.heart,
            AppStrings.titleFavorites,
          ),
          navigationItem(
            FontAwesomeIcons.user,
            AppStrings.titleUser,
          ),
        ],
      ),
    );
  }

  BubbleBottomBarItem navigationItem(IconData icon, String name) {
    return BubbleBottomBarItem(
        backgroundColor: AppColors.yellow50,
        icon: Icon(
          icon,
          color: Colors.black,
        ),
        activeIcon: Icon(
          icon,
          color: Colors.black,
        ),
        title: Text(
          name,
          style: TextStyle(color: Colors.black),
        ));
  }
}
