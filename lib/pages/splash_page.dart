// Flutter
import 'package:flutter/material.dart';

// Providers
import 'package:provider/provider.dart';
import 'package:userapp/providers/location_provider.dart';

// Widgets
import 'package:userapp/widgets/splash/info.dart';
import 'package:userapp/widgets/splash/robot_background.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final locationProvider = Provider.of<LocationProvider>(context);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Container(
        height: screenSize.height,
        width: screenSize.width,
        child: Stack(
          children: [
            ButtonLocation(locationProvider: locationProvider),
            RobotBackground(),
            Info(),
          ],
        ),
      ),
    );
  }
}

class ButtonLocation extends StatelessWidget {
  const ButtonLocation({
    Key key,
    @required this.locationProvider,
  }) : super(key: key);

  final LocationProvider locationProvider;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Positioned(
      top: screenSize.height * 0.03,
      right: screenSize.height * 0.01,
      child: IconButton(
        onPressed: () {
          locationProvider.requestPermission();
        },
        icon: Icon(Icons.location_on),
      ),
    );
  }
}
