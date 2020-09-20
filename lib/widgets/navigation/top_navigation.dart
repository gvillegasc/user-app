import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:userapp/providers/navigation_provider.dart';

class TopNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final navigationProvider = Provider.of<NavigationProvider>(context);
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 10.0,
              offset: Offset(0.0, 0.1))
        ],
      ),
      padding: EdgeInsets.only(top: screenSize.height * 0.035),
      child: BubbleBottomBar(
        opacity: 1,
        backgroundColor: Colors.white,
        currentIndex: navigationProvider.actualPage,
        onTap: (i) {
          navigationProvider.actualPage = i;
        },
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(16), bottomRight: Radius.circular(16)),
        elevation: 0,
        hasNotch: false,
        hasInk: true,
        items: <BubbleBottomBarItem>[
          _itemNavigation(
            context,
            FontAwesomeIcons.home,
            "Home",
          ),
          _itemNavigation(
            context,
            FontAwesomeIcons.comment,
            "Chats",
          ),
          _itemNavigation(
            context,
            FontAwesomeIcons.heart,
            "Favorites",
          ),
          _itemNavigation(
            context,
            FontAwesomeIcons.user,
            "User",
          ),
        ],
      ),
    );
  }

  BubbleBottomBarItem _itemNavigation(
      BuildContext context, IconData icon, String name) {
    return BubbleBottomBarItem(
        backgroundColor: Theme.of(context).primaryColor,
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
