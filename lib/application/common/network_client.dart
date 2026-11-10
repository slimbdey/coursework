abstract class NetworkClient {
  Future<T> get<T>(
    String path,
    T Function(Map<String, dynamic>) fromJson, {
    Map<String, dynamic>? queryParameters = const {},
  });

  Future<String> authenticate(String login, String password);

  Future<String> register(String login, String password);

  Future<String> alterCredentials({
    required String prevLogin,
    required String login,
    required String password,
  });

  Future<List<T>> getList<T>(
    String path,
    T Function(Map<String, dynamic>) fromJson, {
    Map<String, dynamic>? queryParameters = const {},
  });
}
