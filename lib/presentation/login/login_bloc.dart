import 'package:flutter/material.dart';
import 'package:userapp/core/utils/validators.dart';
import 'package:userapp/domain/repository/api_repository.dart';
import 'package:userapp/domain/repository/local_repository.dart';
import 'package:userapp/domain/request/login_request.dart';
import 'package:userapp/domain/response/login_response.dart';

class LoginBLoC with ChangeNotifier {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  String _usernameError;
  String _passwordError;
  bool _isOk = false;

  LoginBLoC({
    this.localRepositoryInterface,
    this.apiRepositoryInterface,
  }) {
    this._usernameController.text = "michael.lawson@reqres.in";
    this._passwordController.text = "cerulean";
    this._isOk = true;
  }

  TextEditingController get usernameController => this._usernameController;
  TextEditingController get passwordController => this._passwordController;

  String get usernameError => this._usernameError;
  String get passwordError => this._passwordError;
  bool get isOk => this._isOk;

  void onChangeUsername() {
    this._usernameError = validateEmail(this._usernameController.text);
    validateData();
  }

  void onChangePassword() {
    this._passwordError = validatePassword(this._passwordController.text);
    validateData();
  }

  void validateData() {
    if (this._passwordError == this._usernameError &&
        this._usernameController.text.length > 0 &&
        this._passwordController.text.length > 0) {
      this._isOk = true;
    } else {
      this._isOk = false;
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
