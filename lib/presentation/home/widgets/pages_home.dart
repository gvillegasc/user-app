import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/presentation/home/chat/chat_page.dart';
import 'package:userapp/presentation/home/favorite/favorite_page.dart';
import 'package:userapp/presentation/home/home_bloc.dart';
import 'package:userapp/presentation/home/info/user_page.dart';
import 'package:userapp/presentation/home/user/user_page.dart';

class PagesHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationBLoC>(context);
    return PageView(
      controller: navigationProvider.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[UserPage(), ChatPage(), FavoritePage(), InfoPage()],
    );
  }
}
