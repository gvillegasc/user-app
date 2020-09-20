import 'package:flutter/material.dart';

// Pages
import 'package:userapp/pages/login_page.dart';
import 'package:userapp/pages/navigation_page.dart';
import 'package:userapp/pages/splash_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'splash': (_) => SplashPage(),
  'login': (_) => LoginPage(),
  'navigation': (_) => NavigationPage(),
};
