import 'package:userapp/domain/model/user_model.dart';
import 'package:userapp/domain/request/login_request.dart';
import 'package:userapp/domain/response/login_response.dart';

abstract class ApiRepositoryInterface {
  Future<List<UserModel>> getUsers(int page);

  Future<LoginResponse> loginUser(LoginRequest loginRequest);
}
