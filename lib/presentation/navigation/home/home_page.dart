import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/injection_container.dart';
import 'package:userapp/presentation/navigation/home/user_bloc.dart';
import 'widgets/list_users.dart';
import 'widgets/loading_users.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (_) => sl<UserBLoC>(),
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
    final UserBLoC userBLoC = Provider.of<UserBLoC>(context);
    print(userBLoC.isLoading);
    return (userBLoC.isLoading)
        ? LoadingUsers()
        : ListUsers(users: userBLoC.users);
  }
}
