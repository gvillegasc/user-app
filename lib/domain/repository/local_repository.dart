abstract class LocalRepositoryInterface {
  Future<String> saveToken(String token);
  Future<String> getToken(String token);
}
