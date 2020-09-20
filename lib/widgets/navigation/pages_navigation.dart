import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Pages
import 'package:userapp/pages/home_page.dart';
import 'package:userapp/pages/user_page.dart';
import 'package:userapp/pages/chats_page.dart';
import 'package:userapp/pages/favorites_page.dart';
import 'package:userapp/providers/navigation_provider.dart';

class PagesNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    return PageView(
      controller: navigationProvider.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[HomePage(), ChatsPage(), FavoritesPage(), UserPage()],
    );
  }
}
