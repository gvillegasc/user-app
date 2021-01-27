import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:userapp/presentation/bloc/user/user_bloc.dart';

import 'widgets/list_users.dart';
import 'widgets/loading_users.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
            padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.075),
            child: BlocBuilder<UserBloc, UserState>(builder: (_, state) {
              return (state.isLoading)
                  ? LoadingUsers()
                  : ListUsers(users: state.users);
            })),
      ),
    );
  }
}
