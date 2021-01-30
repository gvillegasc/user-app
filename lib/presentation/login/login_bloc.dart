import 'package:flutter/material.dart';
import 'package:userapp/core/utils/validators.dart';
import 'package:userapp/domain/repository/api_repository.dart';
import 'package:userapp/domain/repository/local_repository.dart';
import 'package:userapp/domain/request/login_request.dart';
import 'package:userapp/domain/response/login_response.dart';

class LoginBLoC with ChangeNotifier {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  LoginBLoC({
    this.localRepositoryInterface,
    this.apiRepositoryInterface,
  });

  String _usernameController = "michael.lawson@reqres.in";
  String _usernameError;
  String _passwordController = "cerulean";
  String _passwordError;
  bool _isOk = false;

  String get usernameError => this._usernameError;
  String get passwordError => this._passwordError;
  bool get isOk => this._isOk;

  String get usernameController => this._usernameController;
  set usernameController(String value) {
    this._usernameController = value;
    this._usernameError = validateEmail(value);
    validateData();
    notifyListeners();
  }

  String get passwordController => this._passwordController;
  set passwordController(String value) {
    this._passwordController = value;
    this._passwordError = validatePassword(value);
    validateData();
    notifyListeners();
  }

  void validateData() {
    if (this._passwordError == this._usernameError &&
        this._usernameController.length > 0 &&
        this._passwordController.length > 0) {
      this._isOk = true;
    } else {
      this._isOk = false;
    }
    notifyListeners();
  }

  Future<bool> loginUser() async {
    final LoginResponse loginResponse = await apiRepositoryInterface.loginUser(
        LoginRequest(this._usernameController, this._passwordController));
    if (loginResponse != null) {
      await localRepositoryInterface.saveToken(loginResponse.token);
      return true;
    } else {
      return false;
    }
  }
}
