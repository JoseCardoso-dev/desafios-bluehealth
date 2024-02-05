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

          expect(response['success'], true);
          expect(response['data']['user']['cpf'], '123.456.789-00');
          expect(response['data']['user']['plan_coverage'], 'Nacional');
        },
      );

      test(
        'Login with invalid credentials',
        () async {
          // Arrange
          final userRepository = UserRepository();
          const String email = 'teste@example.com';
          const String password = 'teste1234';

          // Act
          final response = await userRepository.loginUser(email, password);

          // Assert
          expect(response['success'], false);
          expect(response['error'], 'Credenciais inválidas');
        },
      );
    },
  );
}
