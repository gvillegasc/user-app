import 'package:flutter/material.dart';
import 'package:userapp/core/app_strings.dart';
import 'package:userapp/core/responsive.dart';
import 'package:userapp/domain/model/user.dart';
import 'package:userapp/presentation/navigation/user/widgets/user_item.dart';

class UserList extends StatelessWidget {
  final List<User> users;

  const UserList({Key key, @required this.users})
      : assert(users != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    return Column(children: [
      Container(
        width: double.infinity,
        margin: EdgeInsets.only(
            bottom: responsive.heightR(2), top: responsive.heightR(15)),
        child: Text(
          AppStrings.textContacts,
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: responsive.heightR(2.5)),
        ),
      ),
      ...List.generate(this.users.length, (i) => UserItem(user: this.users[i])),
    ]);
  }
}
