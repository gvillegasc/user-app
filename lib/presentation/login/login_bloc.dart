import 'package:flutter/material.dart';
import 'package:userapp/core/utils/validators.dart';
import 'package:userapp/domain/repository/api_repository.dart';
import 'package:userapp/domain/repository/local_repository.dart';
import 'package:userapp/domain/request/login_request.dart';
import 'package:userapp/domain/response/login_response.dart';
import 'package:userapp/presentation/routes/routes.dart';
import 'package:userapp/presentation/widgets/single_alert.dart';

class LoginBLoC with ChangeNotifier {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  LoginBLoC({
    this.localRepositoryInterface,
    this.apiRepositoryInterface,
  });

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

  void loginUser(BuildContext context) async {
    final LoginResponse loginResponse = await apiRepositoryInterface.loginUser(
        LoginRequest(this._usernameController, this._passwordController));
    if (loginResponse != null) {
      Navigator.pop(context);
      await localRepositoryInterface.saveToken(loginResponse.token);
      Navigator.pushNamed(context, AppRoutes.navigation);
    } else {
      final Size screenSize = MediaQuery.of(context).size;
      Navigator.pop(context);
      singleAlert(context, screenSize, 'Aviso', "Credenciales incorrectas.");
    }
  }
}
