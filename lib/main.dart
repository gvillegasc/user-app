import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:userapp/presentation/routes/routes.dart';
import 'package:userapp/presentation/themes/theme.dart';
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
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
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
