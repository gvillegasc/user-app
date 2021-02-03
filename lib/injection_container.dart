import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:userapp/data/datasource/api_repository_impl.dart';
import 'package:userapp/data/datasource/local_repository_impl.dart';
import 'package:userapp/domain/repository/local_repository.dart';
import 'package:userapp/presentation/login/login_bloc.dart';
import 'package:userapp/presentation/home/home_bloc.dart';
import 'package:userapp/presentation/home/user/user_bloc.dart';
import 'package:userapp/presentation/splash/splash_bloc.dart';

import 'domain/repository/api_repository.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl.registerLazySingleton<ApiRepositoryInterface>(
    () => ApiRepositoryImpl(client: sl()),
  );
  sl.registerLazySingleton<LocalRepositoryInterface>(
    () => LocalRepositoryImpl(),
  );

  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());

  sl.registerFactory(
    () => SplashBLoC(),
  );
  sl.registerFactory(
    () => LoginBLoC(
      apiRepositoryInterface: sl(),
      localRepositoryInterface: sl(),
    ),
  );
  sl.registerFactory(
    () => UserBLoC(
      apiRepositoryInterface: sl(),
    ),
  );
  sl.registerFactory(
    () => NavigationBLoC(),
  );
}
