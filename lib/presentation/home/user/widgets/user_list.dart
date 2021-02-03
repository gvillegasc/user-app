import 'package:flutter/material.dart';
import 'package:userapp/core/app_strings.dart';
import 'package:userapp/core/app_styles.dart';
import 'package:userapp/core/responsive.dart';
import 'package:userapp/domain/model/user.dart';
import 'package:userapp/presentation/home/user/widgets/user_item.dart';

class UserList extends StatelessWidget {
  final List<User> users;

  const UserList({Key key, @required this.users})
      : assert(users != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final AppStyles appStyles = AppStyles.of(context);
    return Column(children: [
      Container(
        width: double.infinity,
        margin: EdgeInsets.only(
            bottom: responsive.heightR(2), top: responsive.heightR(15)),
        child: Text(
          AppStrings.textContacts,
          style: appStyles.progressTitle(),
        ),
      ),
      ...List.generate(this.users.length, (i) => UserItem(user: this.users[i])),
    ]);
  }
}
