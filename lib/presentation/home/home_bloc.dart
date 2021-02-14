import 'package:flutter/material.dart';

class NavigationBLoC with ChangeNotifier {
  PageController pageController = PageController(initialPage: 0);
  int actualPage = 0;

  void changePage(int page) {
    this.actualPage = page;
    this.pageController.animateToPage(page,
        duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }
}
