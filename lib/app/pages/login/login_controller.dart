import 'package:desafio_bluehealth/app/model/user_model.dart';
import 'package:desafio_bluehealth/app/pages/home/home_page.dart';
import 'package:desafio_bluehealth/app/src/repositories/user_repository.dart';
import 'package:desafio_bluehealth/app/src/utils/transition_page_utils.dart';
import 'package:desafio_bluehealth/app/widgets/alert_message_widget.dart';
import 'package:flutter/material.dart';

/// Controlador da Página de Login
///
/// Este controlador gerencia a lógica de negócios associada à tela de login.

class LoginController {
  /// Controladores para o campo de e-mail e senha.
  final TextEditingController emailController;
  final TextEditingController passwordController;
  late final UserModel user;
  final userRepository = UserRepository();

  LoginController(this.emailController, this.passwordController);

  /// Método para realizar a ação de login.
  void login(BuildContext context) async {
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      AlertMessageWidget.show(
        context,
        message: 'Preencha todos os campos',
      );
    } else {
      final response = await userRepository.loginUser(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (response['success']) {
        user = UserModel.fromJson(response['data']['user']);

        // ignore: use_build_context_synchronously
        TransitionPageUtils.navigateToPage(
          context,
          HomePage(
            user: user,
          ),
        );
      } else {
        // ignore: use_build_context_synchronously
        AlertMessageWidget.show(
          context,
          message: response['error'],
        );
      }
    }
  }
}
