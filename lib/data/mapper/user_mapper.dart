import 'package:userapp/domain/model/user.dart';

class UserMapper {
  List<User> items = new List();

  UserMapper.fromJsonList(List<dynamic> jsonList) {
    if (jsonList == null) return;
    for (var item in jsonList) {
      final user = new User.fromJson(item);
      items.add(user);
    }
  }
}
