import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:userapp/routes/routes.dart';
import 'package:userapp/themes/theme.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UserApp',
      theme: myTheme,
      routes: appRoutes,
      initialRoute: appInitialRoute,
    );
  }
}
