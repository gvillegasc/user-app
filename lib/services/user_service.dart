import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:userapp/models/user_model.dart';
import 'package:userapp/utils/variables.dart';

class UserService {
  Future<List<UserModel>> listUsers(int page) async {
    final _url = "$urlApi/users?page=$page";
    final resp = await http.get(_url);
    final Map<String, dynamic> decodedData = json.decode(resp.body);
    final dynamic dataUsers = UsersModel.fromJsonList(decodedData['data']);
    final List<UserModel> users = dataUsers.items;
    return users;
  }

  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    final authData = {'email': email, 'password': password};
    final _url = "$urlApi/login";
    final resp = await http.post(_url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(authData));
    final decodedData = json.decode(resp.body);
    return decodedData;
  }
}
