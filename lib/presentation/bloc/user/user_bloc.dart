import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:userapp/domain/model/user_model.dart';
import 'package:userapp/domain/repository/api_repository.dart';
import 'package:userapp/domain/repository/local_repository.dart';
import 'package:userapp/domain/request/login_request.dart';
import 'package:userapp/domain/response/login_response.dart';
import 'package:userapp/presentation/widgets/single_alert.dart';
import 'package:userapp/routes/routes.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  // UserBloc() : super(UserState());

  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;
  UserBloc({
    @required this.localRepositoryInterface,
    @required this.apiRepositoryInterface,
  })  : assert(
            localRepositoryInterface != null, apiRepositoryInterface != null),
        super(UserState()) {
    // add(OnLoadUsers());
  }

  @override
  Stream<UserState> mapEventToState(
    UserEvent event,
  ) async* {
    if (event is OnLoadUsers) {
      yield* this._mapOnLoadUsers(event);
    } else if (event is OnSignInUser) {
      yield* this._mapOnSignInUser(event);
    }
  }

  Stream<UserState> _mapOnLoadUsers(OnLoadUsers event) async* {
    yield this.state.copyWith(isLoading: true);
    print("CARGANDO");

    final List<UserModel> users =
        await apiRepositoryInterface.getUsers(this.state.page);
    yield this.state.copyWith(isLoading: false, users: users);
    print("SIN CARGAR");
    print(false);
    print(users);
  }

  Stream<UserState> _mapOnSignInUser(OnSignInUser event) async* {
    final LoginResponse loginResponse = await apiRepositoryInterface
        .loginUser(LoginRequest(event.email, event.password));
    if (loginResponse != null) {
      Navigator.pop(event.context);
      await localRepositoryInterface.saveToken(loginResponse.token);
      add(OnLoadUsers());
      Navigator.pushNamed(event.context, AppRoutes.navigation);
    } else {
      final Size screenSize = MediaQuery.of(event.context).size;
      Navigator.pop(event.context);
      singleAlert(
          event.context, screenSize, 'Aviso', "Credenciales incorrectas.");
    }
    // if (data['token'] != null) {
    //   Navigator.pop(context);
    //   Navigator.pushNamed(context, 'navigation');
    // } else {
    //   Navigator.pop(context);
    //   singleAlert(context, screenSize, 'Aviso', "Credenciales incorrectas.");
    // }
  }
}
