import 'package:shared_preferences/shared_preferences.dart';
import 'package:userapp/domain/repository/local_repository.dart';

const _pref_token = 'TOKEN';

class LocalRepositoryImpl extends LocalRepositoryInterface {
  @override
  Future<String> saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(_pref_token, token);
    return token;
  }

  @override
  Future<String> getToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(_pref_token);
  }
}
