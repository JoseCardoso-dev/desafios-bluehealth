import 'package:desafio_bluehealth/app/model/user_model.dart';

class LoginModel {
  final String email;
  final String password;
  final String messageError;
  final bool successLogin;
  final bool loading;
  final UserModel user;

  LoginModel(
    this.email,
    this.password,
    this.messageError,
    this.successLogin,
    this.loading,
    this.user,
  );

  LoginModel copyWith({
    String? email,
    String? password,
    String? messageError,
    bool? successLogin,
    bool? loading,
    UserModel? user,
  }) {
    return LoginModel(
      email ?? this.email,
      password ?? this.password,
      messageError ?? this.messageError,
      successLogin ?? this.successLogin,
      loading ?? this.loading,
      user ?? this.user,
    );
  }
}
