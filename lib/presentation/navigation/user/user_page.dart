import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/core/responsive.dart';
import 'package:userapp/presentation/navigation/user/user_bloc.dart';
import 'package:userapp/presentation/navigation/user/widgets/user_list.dart';
import 'package:userapp/presentation/widgets/loading_users.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: responsive.widthR(7.5)),
              child: LoadBody())),
    );
  }
}

class LoadBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserBLoC userBLoC = Provider.of<UserBLoC>(context);
    return (userBLoC.userState == UserState.loading)
        ? SingleLoading()
        : UserList(users: userBLoC.users);
  }
}
