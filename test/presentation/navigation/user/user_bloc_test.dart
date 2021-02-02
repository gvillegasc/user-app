import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:userapp/domain/model/user.dart';
import 'package:userapp/presentation/navigation/user/user_bloc.dart';

import '../../../mock/api_repository_mock.dart';

void main() {
  final ApiRepositoryMock apiMock = ApiRepositoryMock();
  final UserBLoC userBLoC = UserBLoC(
    apiRepositoryInterface: apiMock,
  );

  group("UserBLoC test", () {
    test('validate load users', () async {
      final List<User> usersReponse = [];
      when(apiMock.getUsers(1)).thenAnswer((_) => Future.value(usersReponse));

      await userBLoC.loadUsers();

      expect(userBLoC.userState, UserState.completed);
      expect(userBLoC.users, isA<List<User>>());
      expect(userBLoC.users, usersReponse);
      expect(userBLoC.users, isNotNull);
    });
  });
}
