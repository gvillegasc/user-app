import 'package:flutter/material.dart';
import 'package:userapp/core/utils/validators.dart';

class LoginProvider with ChangeNotifier {
  String _usernameController = "";
  String _usernameError;
  String _passwordController = "";
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

  validateData() {
    if (this._passwordError == this._usernameError &&
        this._usernameController.length > 0 &&
        this._passwordController.length > 0) {
      this._isOk = true;
    } else {
      this._isOk = false;
    }
    notifyListeners();
  }
}
