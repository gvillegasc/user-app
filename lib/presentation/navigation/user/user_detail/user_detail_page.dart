import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/presentation/navigation/user/user_bloc.dart';

class UserDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BodyCreated());
  }
}

class BodyCreated extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserBLoC userBLoC = Provider.of<UserBLoC>(context);

    return Container(
      child: (userBLoC.isLoadingUserSelected)
          ? Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                    Theme.of(context).primaryColor),
              ),
            )
          : Center(
              child: Text('Hola desde user detail page'),
            ),
    );
  }
}
