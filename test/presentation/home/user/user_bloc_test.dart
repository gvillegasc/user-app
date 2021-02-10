import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:userapp/domain/model/user.dart';
import 'package:userapp/domain/model/user_detail.dart';
import 'package:userapp/presentation/home/user/user_bloc.dart';

import '../../../mock/api_repository_mock.dart';

void main() {
  final ApiRepositoryMock apiMock = ApiRepositoryMock();
  final UserBLoC userBLoC = UserBLoC(
    apiRepositoryInterface: apiMock,
  );

  group("UserBLoC test", () {
    test('should validate if load users', () async {
      final List<User> usersReponse = [];
      when(apiMock.getUsers(1)).thenAnswer((_) => Future.value(usersReponse));

      await userBLoC.loadUsers();

      expect(userBLoC.userState, UserState.completed);
      expect(userBLoC.users, isA<List<User>>());
      expect(userBLoC.users, usersReponse);
      expect(userBLoC.users, isNotNull);
    });

    test('should validate is user is selected', () async {
      final UserDetail userDetailResponse = UserDetail();
      when(apiMock.getUserSelected(21))
          .thenAnswer((_) => Future.value(userDetailResponse));

      await userBLoC.selectUser(21);

      expect(userBLoC.userSelectedState, UserSelectedState.completed);
      expect(userBLoC.userDetail, isA<UserDetail>());
      expect(userBLoC.userDetail, userDetailResponse);
      expect(userBLoC.userDetail, isNotNull);
    });
  });
}
