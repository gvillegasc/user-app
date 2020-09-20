import 'package:flutter/material.dart';
import 'package:userapp/utils/validators.dart';

class FormProvider with ChangeNotifier {
  String _usernameController = "";
  String _usernameError;
  String _passwordController = "";
  String _passwordError;
  bool _isOk = false;

  // Getters
  String get usernameController => this._usernameController;
  String get usernameError => this._usernameError;
  String get passwordController => this._passwordController;
  String get passwordError => this._passwordError;
  bool get isOk => this._isOk;

  // Setters
  set usernameController(String value) {
    this._usernameController = value;
    this._usernameError = validateEmail(value);
    validateData();
    notifyListeners();
  }

  set passwordController(String value) {
    this._passwordController = value;
    this._passwordError = validatePassword(value);
    validateData();

    notifyListeners();
  }

  // Functions

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
