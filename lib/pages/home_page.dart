// Flutter
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Providers
import 'package:provider/provider.dart';
import 'package:userapp/providers/user_provider.dart';

// Widgets
import 'package:userapp/widgets/home/list_users.dart';
import 'package:userapp/widgets/home/loading_users.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenSize.width * 0.075),
          child: (userProvider.isLoading)
              ? LoadingUsers()
              : ListUsers(users: userProvider.users),
        ),
      ),
    );
  }
}
