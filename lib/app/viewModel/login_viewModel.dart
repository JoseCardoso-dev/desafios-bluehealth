// ignore_for_file: file_names

import 'package:desafio_bluehealth/app/model/login_model.dart';
import 'package:desafio_bluehealth/app/model/user_model.dart';
import 'package:desafio_bluehealth/app/src/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class LoginViewModel extends ValueNotifier<LoginModel> {
  LoginViewModel() : super(LoginModel('', '', '', false, false, UserModel()));

  UserRepository userRepository = UserRepository();

  bool get loading => value.loading;
  bool get successLogin => value.successLogin;
  String get messageError => value.messageError;

  void changeEmailAndPassword(String email, String password) {
    value = value.copyWith(
      email: email.trim(),
      password: password.trim(),
    );
  }

  void changeMessageError(String messageError) {
    value = value.copyWith(messageError: messageError);
  }

  Future<void> initUserStorage() async {
    await userRepository.initUserStorage();
  }

  Future<void> login() async {
    value = value.copyWith(loading: true);
    final result = await userRepository.loginUser(value.email, value.password);
    value = value.copyWith(
      successLogin: result['success'],
      loading: false,
      messageError: result['error'],
      user: result['data'] == null
          ? null
          : UserModel.fromJson(
              result['data']['user'],
            ),
    );
    if (result['success']) {
      await userRepository.saveUserStorage(value.user);
    }
  }
}
