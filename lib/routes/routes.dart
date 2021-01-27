import 'package:flutter/material.dart';
import 'package:userapp/presentation/login/login_page.dart';
import 'package:userapp/presentation/navigation/navigation_page.dart';
import 'package:userapp/presentation/splash/splash_page.dart';

class AppRoutes {
  static final String splash = '/splash';
  static final String login = '/login';
  static final String navigation = '/navigation';
}

final Map<String, Widget Function(BuildContext)> appRoutes = {
  AppRoutes.splash: (_) => SplashPage(),
  AppRoutes.login: (_) => LoginPage(),
  AppRoutes.navigation: (_) => NavigationPage(),
};

final String appInitialRoute = AppRoutes.splash;
