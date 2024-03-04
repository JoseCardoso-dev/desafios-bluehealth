import 'package:desafio_bluehealth/app/model/user_model.dart';
import 'package:desafio_bluehealth/app/src/repositories/user_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(
    'UserRepository',
    () {
      test(
        'Login with valid credentials',
        () async {
          final userRepository = UserRepository();
          const String email = 'blue@example.com';
          const String password = '12345678';

          final response = await userRepository.loginUser(email, password);
          UserModel user = UserModel.fromJson(response['data']['user']);

          expect(response['success'], true);
          expect(user.cpf, '123.456.789-00');
          expect(user.planCoverage, 'Nacional');
        },
      );

      test(
        'Login with invalid credentials',
        () async {
          final userRepository = UserRepository();
          const String email = 'teste@example.com';
          const String password = 'teste1234';

          final response = await userRepository.loginUser(email, password);

          expect(response['success'], false);
          expect(response['error'], 'Credenciais inválidas');
        },
      );
    },
  );
}
