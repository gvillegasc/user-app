import 'package:flutter/material.dart';

class NavigationProvider with ChangeNotifier {
  PageController _pageController = PageController(initialPage: 0);
  int _actualPage = 0;

  // Getters
  get pageController => this._pageController;
  get actualPage => this._actualPage;

  // Setters
  set actualPage(int value) {
    _actualPage = value;
    _pageController.animateToPage(value,
        duration: Duration(milliseconds: 250), curve: Curves.easeOut);
    notifyListeners();
  }
}
