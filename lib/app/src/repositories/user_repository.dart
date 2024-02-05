import 'package:desafio_bluehealth/app/src/api/http_api_client.dart';
import 'package:desafio_bluehealth/app/src/api/i_api_client.dart';

/// Repositório para operações relacionadas ao usuário.
class UserRepository {
  late final ApiClient _apiClient;

  UserRepository({ApiClient? apiClient}) {
    /// Cliente de API utilizado para realizar chamadas HTTP.
    _apiClient = apiClient ?? HttpService();
  }

  /// Realiza o login do usuário.
  ///
  /// [email]: O e-mail do usuário.
  /// [password]: A senha do usuário.
  ///
  /// Retorna um mapa contendo informações sobre o resultado do login.
  /// Se o login for bem-sucedido, retorna {'success': true, 'data': userData}.
  /// Em caso de erro, retorna {'success': false, 'error': errorMessage}.
  Future<Map<String, dynamic>> loginUser(String email, String password) async {
    try {
      final response = await _apiClient.postDataNoToken(
        'login',
        {
          "email": email,
          "password": password,
        },
      );

      if (response['status'] == 200) {
        return {'success': true, 'data': response['data']};
      } else if (response['status'] == 400) {
        return {'success': false, 'error': 'Requisição inválida'};
      } else if (response['status'] == 401) {
        return {'success': false, 'error': 'Credenciais inválidas'};
      } else {
        return {'success': false, 'error': 'Erro desconhecido'};
      }
    } catch (e) {
      return {'success': false, 'error': 'Sem conexão com a internet'};
    }
  }
}
