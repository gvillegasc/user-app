import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/injection_container.dart';
import 'package:userapp/presentation/navigation/home/home_bloc.dart';
import 'package:userapp/presentation/navigation/home/widgets/user_list.dart';
import 'package:userapp/presentation/widgets/loading_users.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (_) => sl<HomeBLoC>(),
      child: Scaffold(
        body: SingleChildScrollView(
            child: Container(
                padding:
                    EdgeInsets.symmetric(horizontal: screenSize.width * 0.075),
                child: LoadBody())),
      ),
    );
  }
}

class LoadBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HomeBLoC userBLoC = Provider.of<HomeBLoC>(context);
    return (userBLoC.isLoading)
        ? SingleLoading()
        : UserList(users: userBLoC.users);
  }
}
