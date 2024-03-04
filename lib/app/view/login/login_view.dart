import 'package:desafio_bluehealth/app/src/utils/transition_page_utils.dart';
import 'package:desafio_bluehealth/app/view/home/home_view.dart';
import 'package:desafio_bluehealth/app/src/utils/responsive_utils.dart';
import 'package:desafio_bluehealth/app/viewModel/login_viewModel.dart';
import 'package:desafio_bluehealth/app/widgets/alert_message_widget.dart';
import 'package:desafio_bluehealth/app/widgets/loginViewWidgets/element_login_widget.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

/// Tela de Login
///
/// Esta tela permite que os usuários ingressem com suas contas no aplicativo.
/// Ela inclui campos para inserir credenciais (e-mail e senha) e botões para
/// realizar a autenticação.

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final ResponsiveUltils responsiveUltils = ResponsiveUltils();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode passwordFocusNode = FocusNode();
  final LoginViewModel loginViewModel = LoginViewModel();

  @override
  void initState() {
    super.initState();
    loginViewModel.initUserStorage();
  }

  @override
  void dispose() {
    super.dispose();
    loginViewModel.dispose();
  }

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
              padding: const EdgeInsets.symmetric(
                horizontal: 30,
                vertical: 25,
              ),
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
                              controller: emailController,
                              onSubmitted: (value) {
                                passwordFocusNode.requestFocus();
                              },
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
                              controller: passwordController,
                              onSubmitted: (value) async {
                                await login();
                              },
                              focusNode: passwordFocusNode,
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
                    child: ValueListenableBuilder(
                      valueListenable: loginViewModel,
                      builder: (context, value, child) {
                        return TextButton(
                          onPressed: loginViewModel.loading
                              ? null
                              : () async {
                                  await login();
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
                              child: loginViewModel.loading
                                  ? Center(
                                      child: LoadingAnimationWidget
                                          .fourRotatingDots(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .background,
                                        size: 30 *
                                            responsiveUltils
                                                .getImageScale(context),
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
                      },
                    ),
                  ),
                  SizedBox(
                    height: responsiveUltils.getHeightSpacing(context, 40),
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

  Future<void> login() async {
    if (FocusScope.of(context).isFirstFocus) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
    if (emailController.text.trim().isEmpty ||
        passwordController.text.trim().isEmpty) {
      AlertMessageWidget.show(
        context,
        message: 'Preencha todos os campos',
      );
    } else {
      loginViewModel.changeEmailAndPassword(
        emailController.text,
        passwordController.text,
      );
      await loginViewModel.login();
      if (loginViewModel.successLogin) {
        // ignore: use_build_context_synchronously
        TransitionPageUtils.navigateToPage(
          context,
          const HomeView(),
        );
      } else if (loginViewModel.messageError.isNotEmpty) {
        // ignore: use_build_context_synchronously
        AlertMessageWidget.show(
          context,
          message: loginViewModel.messageError,
        );
      }
    }
  }
}
