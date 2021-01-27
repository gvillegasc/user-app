import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/presentation/navigation/chat/chat_page.dart';
import 'package:userapp/presentation/navigation/favorite/favorite_page.dart';
import 'package:userapp/presentation/navigation/home/home_page.dart';
import 'package:userapp/presentation/navigation/user/user_page.dart';
import '../navigation_provider.dart';

class PagesNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    return PageView(
      controller: navigationProvider.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[HomePage(), ChatPage(), FavoritePage(), UserPage()],
    );
  }
}
