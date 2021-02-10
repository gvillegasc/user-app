import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:userapp/domain/request/login_request.dart';
import 'package:userapp/presentation/login/login_bloc.dart';

import '../../mock/api_repository_mock.dart';
import '../../mock/form_validator_mock.dart';
import '../../mock/local_repository_mock.dart';

void main() {
  final ApiRepositoryMock apiMock = ApiRepositoryMock();
  final LocalRepositoryMock localMock = LocalRepositoryMock();
  final FormValidatorMock formValidatorMock = FormValidatorMock();
  final LoginBLoC loginBLoC = LoginBLoC(
      apiRepositoryInterface: apiMock,
      localRepositoryInterface: localMock,
      formValidator: formValidatorMock);

  group("LoginBLoC test", () {
    test('should validate if login is worked', () async {
      loginBLoC.usernameController.text = "test@testland";
      loginBLoC.passwordController.text = "123";
      when(apiMock.loginUser(LoginRequest(loginBLoC.usernameController.text,
              loginBLoC.passwordController.text)))
          .thenAnswer((_) async => null);

      final bool isLogged = await loginBLoC.loginUser();

      expect(isLogged, isNotNull);
      expect(isLogged, isA<bool>());
    });

    test('should be valid LoginState', () async {
      loginBLoC.usernameController.text = "test@testland.com";
      loginBLoC.passwordController.text = "123456";

      when(formValidatorMock.validateEmail(loginBLoC.usernameController.text))
          .thenReturn(null);

      when(formValidatorMock
              .validatePassword(loginBLoC.passwordController.text))
          .thenReturn(null);

      loginBLoC.onChangeUsername();
      loginBLoC.onChangePassword();

      expect(loginBLoC.usernameError, isNull);
      expect(loginBLoC.passwordError, isNull);
      expect(loginBLoC.loginState, equals(LoginState.valid));
    });

    test('should be invalid LoginState', () async {
      loginBLoC.usernameController.text = "test@testland";
      loginBLoC.passwordController.text = "1234";

      when(formValidatorMock.validateEmail(loginBLoC.usernameController.text))
          .thenReturn("Email inválido");

      when(formValidatorMock
              .validatePassword(loginBLoC.passwordController.text))
          .thenReturn("Password inválida");

      loginBLoC.onChangeUsername();
      loginBLoC.onChangePassword();

      expect(loginBLoC.usernameError, equals("Email inválido"));
      expect(loginBLoC.passwordError, equals("Password inválida"));
      expect(loginBLoC.loginState, equals(LoginState.invalid));
    });
  });
}
