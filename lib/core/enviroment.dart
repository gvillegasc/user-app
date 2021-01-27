import 'package:flutter_dotenv/flutter_dotenv.dart';

class Enviroment {
  Enviroment._internal();
  static Enviroment _instance = Enviroment._internal();
  static Enviroment get instance => _instance;

  static String pathEnv = "assets/env/.env_dev";

  Future<Map<String, String>> loadEnvFile() async {
    DotEnv instance = DotEnv();
    await instance.load(pathEnv);
    return instance.env;
  }
}
