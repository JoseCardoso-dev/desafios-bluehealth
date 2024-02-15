import 'package:desafio_bluehealth/app/pages/login/login_controller.dart';
import 'package:desafio_bluehealth/app/src/utils/responsive_utils.dart';
import 'package:desafio_bluehealth/app/widgets/element_login_widget.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

/// Tela de Login
///
/// Esta tela permite que os usuários ingressem com suas contas no aplicativo.
/// Ela inclui campos para inserir credenciais (e-mail e senha) e botões para
/// realizar a autenticação.

class LoginPage extends StatelessWidget {
  final ResponsiveUltils responsiveUltils = ResponsiveUltils();
  final LoginController loginController = LoginController();

  LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: responsiveUltils.getHeightSpacing(context, 400),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Stack(
                children: [
                  // #=====#=====# Elementos de decoração #=====#=====#
                  ElementLogin(
                    left: 30,
                    top: 0,
                    width: 80,
                    height: 200,
                    imagePath: 'assets/images/light-1.png',
                    fadeInDuration: 1000,
                  ),
                  ElementLogin(
                    left: 140,
                    top: 0,
                    width: 80,
                    height: 150,
                    imagePath: 'assets/images/light-2.png',
                    fadeInDuration: 1200,
                  ),
                  ElementLogin(
                    right: 40,
                    top: 40,
                    width: 60,
                    height: 150,
                    imagePath: 'assets/images/logo.png',
                    fadeInDuration: 1300,
                  ),

                  // #=====#=====# Título da tela #=====#=====#
                  Positioned(
                    child: FadeInUp(
                      duration: const Duration(milliseconds: 1600),
                      child: Container(
                        margin: const EdgeInsets.only(top: 50),
                        child: Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.background,
                              fontSize:
                                  40 * responsiveUltils.getTextScale(context),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            // #=====#=====# Decoração que envolve os campos de e-mail e senha #=====#=====#
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  FadeInUp(
                    duration: const Duration(milliseconds: 1800),
                    child: Container(
                      padding: const EdgeInsets.all(7),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context).colorScheme.secondary,
                            blurRadius: 20.0,
                            offset: const Offset(0, 10),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          // #=====#=====# Campo de E-mail #=====#=====#
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                              ),
                            ),
                            child: TextField(
                              controller: LoginController.emailController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                                hintStyle: TextStyle(
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                              ),
                            ),
                          ),

                          // #=====#=====# Campo de Senha #=====#=====#
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              controller: LoginController.passwordController,
                              obscureText: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Senha",
                                hintStyle: TextStyle(
                                  color: Theme.of(context).colorScheme.tertiary,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: responsiveUltils.getHeightSpacing(context, 50),
                  ),

                  // #=====#=====# Botão de Login #=====#=====#
                  FadeInUp(
                    duration: const Duration(milliseconds: 1900),
                    child: ValueListenableBuilder<bool>(
                        valueListenable: LoginController.isLoading,
                        builder: (context, value, child) {
                          return TextButton(
                            onPressed: value
                                ? null
                                : () {
                                    if (FocusScope.of(context).isFirstFocus) {
                                      FocusScope.of(context).unfocus();
                                    }
                                    loginController.login(context);
                                  },
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.all(0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: Colors.transparent,
                            ),
                            child: Ink(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    Theme.of(context).colorScheme.primary,
                                    Theme.of(context).colorScheme.secondary,
                                  ],
                                ),
                              ),
                              child: Container(
                                height: responsiveUltils.getHeightSpacing(
                                    context, 50),
                                alignment: Alignment.center,
                                child: value
                                    ? const Padding(
                                        padding: EdgeInsets.all(10),
                                        child: CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                      )
                                    : Text(
                                        "Login",
                                        style: TextStyle(
                                          fontSize: 20 *
                                              responsiveUltils
                                                  .getTextScale(context),
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: responsiveUltils.getHeightSpacing(context, 70),
                  ),

                  // #=====#=====# Texto "Esqueceu a Senha?" #=====#=====#
                  FadeInUp(
                    duration: const Duration(milliseconds: 2000),
                    child: Text(
                      "Esqueceu a Senha?",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
