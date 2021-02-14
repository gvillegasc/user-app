import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:userapp/presentation/home/user/user_bloc.dart';
import 'package:userapp/presentation/home/user/user_detail/widgets/detail.dart';
import 'package:userapp/presentation/widgets/single_loading.dart';

class UserDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final UserBLoC userBLoC = Provider.of<UserBLoC>(context);
    return Scaffold(body: Container(child: validateState(userBLoC)));
  }

  Widget validateState(UserBLoC userBLoC) {
    switch (userBLoC.userSelectedState) {
      case UserSelectedState.loading:
        return SingleLoading();
        break;
      case UserSelectedState.completed:
        return Detail(userDetail: userBLoC.userDetail);
        break;
      default:
        return Container();
    }
  }
}
