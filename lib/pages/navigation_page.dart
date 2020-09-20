// Flutter
import 'package:flutter/material.dart';

// Providers
import 'package:provider/provider.dart';
import 'package:userapp/providers/navigation_provider.dart';

// Widgets
import 'package:userapp/widgets/navigation/pages_navigation.dart';
import 'package:userapp/widgets/navigation/top_navigation.dart';

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: Scaffold(
        body: Container(
          height: screenSize.height,
          width: screenSize.width,
          child: Stack(
            children: [
              PagesNavigation(),
              TopNavigation(),
            ],
          ),
        ),
      ),
    );
  }
}
