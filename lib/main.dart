// Flutter
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Providers
import 'package:provider/provider.dart';
import 'package:userapp/providers/location_provider.dart';
import 'package:userapp/providers/user_provider.dart';

import 'package:userapp/routes/routes.dart'; // Routes
import 'package:userapp/themes/theme.dart'; // Theme

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      // Position only portrait
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // notch color
      statusBarIconBrightness: Brightness.dark, //top bar icons
    ));
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => LocationProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'UserApp',
        theme: myTheme,
        initialRoute: 'splash',
        routes: appRoutes,
      ),
    );
  }
}
