import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:userapp/core/responsive.dart';
import 'package:userapp/injection_container.dart';
import 'package:userapp/presentation/bloc/user/user_bloc.dart';
import 'package:userapp/presentation/navigation/navigation_provider.dart';
import 'widgets/pages_navigation.dart';
import 'widgets/top_navigation.dart';

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return BlocProvider(
      create: (_) => sl<UserBloc>(),
      child: ChangeNotifierProvider(
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
      ),
    );
  }
}
