import 'package:shared_preferences/shared_preferences.dart';
import 'package:userapp/domain/repository/local_repository.dart';

class Preferences {
  static const String pref_token = 'TOKEN';
}

class LocalRepositoryImpl extends LocalRepositoryInterface {
  @override
  Future<String> saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(Preferences.pref_token, token);
    return token;
  }

  @override
  Future<String> getToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(Preferences.pref_token) ?? "";
  }
}
