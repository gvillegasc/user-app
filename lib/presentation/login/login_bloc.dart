import 'package:flutter/material.dart';
import 'package:userapp/core/util/form_validator.dart';
import 'package:userapp/domain/repository/api_repository.dart';
import 'package:userapp/domain/repository/local_repository.dart';
import 'package:userapp/domain/request/login_request.dart';
import 'package:userapp/domain/response/login_response.dart';

enum LoginState { valid, invalid }

class LoginBLoC with ChangeNotifier {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;
  final FormValidator formValidator;

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String usernameError;
  String passwordError;
  LoginState loginState;

  LoginBLoC(
      {this.localRepositoryInterface,
      this.apiRepositoryInterface,
      this.formValidator}) {
    this.usernameController.text = "michael.lawson@reqres.in";
    this.passwordController.text = "cerulean";
    this.loginState = LoginState.valid;
  }

  void onChangeUsername() {
    this.usernameError =
        formValidator.validateEmail(this.usernameController.text);
    validateData();
  }

  void onChangePassword() {
    this.passwordError =
        formValidator.validatePassword(this.passwordController.text);
    validateData();
  }

  void validateData() {
    if (this.passwordError == this.usernameError &&
        this.usernameController.text.length > 0 &&
        this.passwordController.text.length > 0) {
      this.loginState = LoginState.valid;
    } else {
      this.loginState = LoginState.invalid;
    }
    notifyListeners();
  }

  Future<bool> loginUser() async {
    final LoginResponse loginResponse = await apiRepositoryInterface.loginUser(
        LoginRequest(
            this.usernameController.text, this.passwordController.text));
    if (loginResponse != null) {
      await localRepositoryInterface.saveToken(loginResponse.token);
      return true;
    } else {
      return false;
    }
  }
}
