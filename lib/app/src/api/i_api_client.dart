/// Interface para Cliente de API
///
/// Esta interface define métodos para interação com uma API, incluindo
abstract class ApiClient {
  Future<Map<String, dynamic>> postDataNoToken(
    String endpoint,
    Map<String, dynamic> data,
  );
}
