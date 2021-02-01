import 'package:userapp/domain/model/user.dart';
import 'package:userapp/domain/model/user_detail.dart';
import 'package:userapp/domain/request/login_request.dart';
import 'package:userapp/domain/response/login_response.dart';

abstract class ApiRepositoryInterface {
  Future<List<User>> getUsers(int page);
  Future<UserDetail> getUserSelected(int userId);

  Future<LoginResponse> loginUser(LoginRequest loginRequest);
}
