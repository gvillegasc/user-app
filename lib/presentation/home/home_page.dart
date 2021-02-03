import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/core/responsive.dart';
import 'package:userapp/injection_container.dart';
import 'package:userapp/presentation/home/home_bloc.dart';
import 'package:userapp/presentation/home/widgets/pages_home.dart';
import 'package:userapp/presentation/home/widgets/top_navigation.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return ChangeNotifierProvider(
      create: (_) => sl<NavigationBLoC>(),
      child: Scaffold(
        body: Container(
          height: responsive.height,
          width: responsive.width,
          child: Stack(
            children: [
              PagesHome(),
              TopNavigation(),
            ],
          ),
        ),
      ),
    );
  }
}
