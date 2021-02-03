import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/core/responsive.dart';
import 'package:userapp/presentation/home/user/user_bloc.dart';
import 'package:userapp/presentation/home/user/widgets/user_list.dart';
import 'package:userapp/presentation/widgets/single_loading.dart';

class UserPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final UserBLoC userBLoC = Provider.of<UserBLoC>(context);
    return Scaffold(
      body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.symmetric(horizontal: responsive.widthR(7.5)),
              child: (userBLoC.userState == UserState.loading)
                  ? Container(height: responsive.height, child: SingleLoading())
                  : UserList(users: userBLoC.users))),
    );
  }
}
