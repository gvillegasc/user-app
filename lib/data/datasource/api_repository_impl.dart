import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:userapp/core/enviroment.dart';
import 'package:userapp/domain/model/user.dart';
import 'package:userapp/domain/repository/api_repository.dart';
import 'package:userapp/domain/request/login_request.dart';
import 'package:userapp/domain/response/login_response.dart';

class RequestType {
  static const String get = 'get';
  static const String post = 'post';
  static const String patch = 'patch';
}

class ApiRepositoryImpl extends ApiRepositoryInterface {
  final http.Client client;

  ApiRepositoryImpl({@required this.client});

  @override
  Future<List<User>> getUsers(int page) async {
    // final Map<String, String> env = await Enviroment.instance.loadEnvFile();

    // final url = "${env["API_URL"].toString()}/users?page=$page";
    // final resp = await http.get(url);
    final resp = await apiRequest("/users?page=$page");

    try {
      if (resp.statusCode == 200) {
        final Map<String, dynamic> decodedData = json.decode(resp.body);
        final dynamic dataUsers = UsersModel.fromJsonList(decodedData['data']);
        final List<User> users = dataUsers.items;
        return users;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  @override
  Future<LoginResponse> loginUser(LoginRequest loginRequest) async {
    // final Map<String, String> env = await Enviroment.instance.loadEnvFile();

    final body = {
      'email': loginRequest.username,
      'password': loginRequest.password
    };
    // final url = "${env["API_URL"].toString()}/login";
    // final resp = await http.post(url,
    //     headers: {"Content-Type": "application/json"}, body: json.encode(body));

    final resp = await apiRequest("/login", type: RequestType.post, body: body);

    try {
      if (resp.statusCode == 200) {
        final decodedData = json.decode(resp.body);
        return LoginResponse(decodedData["token"]);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<dynamic> apiRequest(String endpoint,
      {String type = RequestType.get, Map<String, dynamic> body}) async {
    final Map<String, String> env = await Enviroment.instance.loadEnvFile();

    final url = "${env["API_URL"].toString()}$endpoint";
    dynamic resp;

    if (type == RequestType.post) {
      resp = await http.post(url,
          headers: {"Content-Type": "application/json"},
          body: json.encode(body));
      return resp;
    } else {
      resp = await http.get(url);
      return resp;
    }
  }
}
