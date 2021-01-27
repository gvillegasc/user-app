import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:meta/meta.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashState()) {
    add(OnRequestPermission());
  }

  @override
  Stream<SplashState> mapEventToState(
    SplashEvent event,
  ) async* {
    if (event is OnRequestPermission) {
      yield* this._mapOnRequestPermission(event);
    }
  }

  Stream<SplashState> _mapOnRequestPermission(
      OnRequestPermission event) async* {
    final PermissionStatus permissionRequestResult = await LocationPermissions()
        .requestPermissions(permissionLevel: this.state.locationPermission);
    yield this.state.copyWith(permissionStatus: permissionRequestResult);
  }
}
