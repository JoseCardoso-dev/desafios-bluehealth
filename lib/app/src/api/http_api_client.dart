// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:desafio_bluehealth/app/src/api/i_api_client.dart';

/// Implementação da interface [ApiClient] utilizando HTTP para comunicação.
class HttpService implements ApiClient {
  /// URL base para todas as requisições HTTP.
  final String baseUrl;

  HttpService({this.baseUrl = 'http://exemplo.com.br'});

  /// [endpoint]: O endpoint específico da API para o qual os dados serão enviados.
  /// [data]: Os dados a serem enviados para a API.

  /// Envia dados para a API sem a necessidade de um token de autenticação.
  /// Retorna um mapa contendo a resposta simulada da API.
  @override
  Future<Map<String, dynamic>> postDataNoToken(
      String endpoint, Map<String, dynamic> data) async {
    await Future.delayed(const Duration(seconds: 2));

    // Simula uma resposta da API
    if (data['email'] == 'blue@example.com' && data['password'] == '12345678') {
      return {
        'status': 200,
        'data': {
          "token": "sasdaeert234235sdas",
          "user": {
            "img_url":
                "https://media.licdn.com/dms/image/D4D03AQEL6Ed4-Q5aEw/profile-displayphoto-shrink_200_200/0/1678056655137?e=2147483647&v=beta&t=cC17D0LYjU-OSMAnKymBew9UFznPPVbec6fRIz8TRyk",
            "name": "José Roberto Souza Cardoso",
            "cpf": "123.456.789-00",
            "blood_group": "A+",
            "health_insurance": "BLUE START + III",
            "rg": "123456789",
            "emergency_contact": "(77) 99822-7290",
            "plan_coverage": "Nacional",
            "plan_validity": "12/2024"
          }
        }
      };
    } else {
      return {
        'status': 401,
        'error': 'Invalid credentials',
      };
    }
  }
}
