// ignore_for_file: file_names
import 'package:desafio_bluehealth/app/model/home_model.dart';
import 'package:desafio_bluehealth/app/model/user_model.dart';
import 'package:desafio_bluehealth/app/src/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class HomeViewModel extends ValueNotifier<HomeModel> {
  HomeViewModel() : super(HomeModel(1, true, UserModel()));
  final UserRepository userRepository = UserRepository();

  int get currentOption => value.currentOption;
  UserModel get user => value.user;
  bool get loading => value.loading;

  void changeOption(int index) {
    value.currentOption = index;
    notifyListeners();
  }

  void loadDataUser() async {
    await userRepository.initUserStorage();
    final user = await userRepository.getUserStorage();
    value = value.copyWith(loading: false, user: user);
  }
}
