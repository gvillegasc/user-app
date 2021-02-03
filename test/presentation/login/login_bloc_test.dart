import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:userapp/domain/request/login_request.dart';
import 'package:userapp/presentation/login/login_bloc.dart';

import '../../mock/api_repository_mock.dart';
import '../../mock/local_repository_mock.dart';

void main() {
  final ApiRepositoryMock apiMock = ApiRepositoryMock();
  final LocalRepositoryMock localMock = LocalRepositoryMock();
  final LoginBLoC loginBLoC = LoginBLoC(
    apiRepositoryInterface: apiMock,
    localRepositoryInterface: localMock,
  );

  group("LoginBLoC test", () {
    test('validate if login is worked', () async {
      when(apiMock.loginUser(LoginRequest('username', 'password')))
          .thenAnswer((_) async => null);

      final bool isLogged = await loginBLoC.loginUser();

      expect(isLogged, isNotNull);
      expect(isLogged, isA<bool>());
    });

    test('validate that LoginState is valid', () async {
      loginBLoC.passwordError = null;
      loginBLoC.usernameError = null;
      loginBLoC.usernameController.text = "test@testland.com";
      loginBLoC.passwordController.text = "123456";

      loginBLoC.validateData();

      expect(loginBLoC.loginState, isNotNull);
      expect(loginBLoC.loginState, equals(LoginState.valid));
    });

    test('validate that LoginState is invalid', () async {
      loginBLoC.passwordError = "Password inválida";
      loginBLoC.usernameError = "Email inválido";
      loginBLoC.usernameController.text = "test@testland.com";
      loginBLoC.passwordController.text = "123456";

      loginBLoC.validateData();

      expect(loginBLoC.loginState, isNotNull);
      expect(loginBLoC.loginState, equals(LoginState.invalid));
    });
  });
}
