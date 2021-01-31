import 'package:flutter/material.dart';
import 'package:userapp/presentation/login/login_page.dart';
import 'package:userapp/presentation/navigation/navigation_page.dart';
import 'package:userapp/presentation/navigation/user/user_detail/user_detail_page.dart';
import 'package:userapp/presentation/splash/splash_page.dart';

class AppRoutes {
  static final String splash = '/splash';
  static final String login = '/login';
  static final String navigation = '/navigation';
  static final String userDetail = '/user_detail';
}

final Map<String, Widget Function(BuildContext)> appRoutes = {
  AppRoutes.splash: (_) => SplashPage(),
  AppRoutes.login: (_) => LoginPage(),
  AppRoutes.navigation: (_) => NavigationPage(),
  AppRoutes.userDetail: (_) => UserDetailPage()
};

final String appInitialRoute = AppRoutes.splash;
