import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/core/responsive.dart';
import 'package:userapp/presentation/navigation/navigation_provider.dart';
import 'widgets/pages_navigation.dart';
import 'widgets/top_navigation.dart';

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: Scaffold(
        body: Container(
          height: responsive.height,
          width: responsive.width,
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
