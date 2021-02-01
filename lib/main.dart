import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:userapp/presentation/routes/routes.dart';
import 'package:userapp/presentation/themes/theme.dart';
import 'injection_container.dart' as di;
import 'injection_container.dart';
import 'presentation/navigation/user/user_bloc.dart';

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
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => sl<UserBLoC>())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'UserApp',
        theme: myTheme,
        routes: appRoutes,
        initialRoute: appInitialRoute,
      ),
    );
  }
}
