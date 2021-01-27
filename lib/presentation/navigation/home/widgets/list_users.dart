import 'package:flutter/material.dart';
import 'package:userapp/domain/model/user_model.dart';
import 'package:userapp/presentation/navigation/home/widgets/user_item.dart';

class ListUsers extends StatelessWidget {
  final List<UserModel> users;

  const ListUsers({Key key, @required this.users}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final childrenUsers = <Widget>[];
    childrenUsers.add(
      SizedBox(
        height: screenSize.height * 0.15,
      ),
    );
    childrenUsers.add(
      Container(
        width: double.infinity,
        margin: EdgeInsets.only(bottom: screenSize.height * 0.02),
        child: Text(
          "CONTACTOS",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: screenSize.height * 0.025),
        ),
      ),
    );
    for (var i = 0; i < users.length; i++) {
      childrenUsers.add(UserItem(
        firstName: users[i].firstName,
        lastName: users[i].lastName,
        urlImage: users[i].avatar,
        email: users[i].email,
      ));
    }

    return Column(
      children: childrenUsers,
    );
  }
}
