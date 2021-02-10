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

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _usernameError;
  String _passwordError;
  LoginState _loginState;

  LoginBLoC(
      {this.localRepositoryInterface,
      this.apiRepositoryInterface,
      this.formValidator}) {
    this._usernameController.text = "michael.lawson@reqres.in";
    this._passwordController.text = "cerulean";
    this._loginState = LoginState.valid;
  }

  TextEditingController get usernameController => this._usernameController;
  set usernameController(TextEditingController value) {
    this._usernameController = value;
    notifyListeners();
  }

  TextEditingController get passwordController => this._passwordController;
  set passwordController(TextEditingController value) {
    this._passwordController = value;
    notifyListeners();
  }

  String get usernameError => this._usernameError;
  set usernameError(String value) {
    this._usernameError = value;
    notifyListeners();
  }

  String get passwordError => this._passwordError;
  set passwordError(String value) {
    this._passwordError = value;
    notifyListeners();
  }

  LoginState get loginState => this._loginState;
  set loginState(LoginState value) {
    this._loginState = value;
    notifyListeners();
  }

  void onChangeUsername() {
    this._usernameError =
        formValidator.validateEmail(this._usernameController.text);
    validateData();
  }

  void onChangePassword() {
    this._passwordError =
        formValidator.validatePassword(this._passwordController.text);
    validateData();
  }

  void validateData() {
    if (this._passwordError == this._usernameError &&
        this._usernameController.text.length > 0 &&
        this._passwordController.text.length > 0) {
      this._loginState = LoginState.valid;
    } else {
      this._loginState = LoginState.invalid;
    }
    notifyListeners();
  }

  Future<bool> loginUser() async {
    final LoginResponse loginResponse = await apiRepositoryInterface.loginUser(
        LoginRequest(
            this._usernameController.text, this._passwordController.text));
    if (loginResponse != null) {
      await localRepositoryInterface.saveToken(loginResponse.token);
      return true;
    } else {
      return false;
    }
  }
}
