import 'package:desafio_bluehealth/app/model/user_model.dart';

class HomeModel {
  int currentOption;
  bool loading;
  UserModel user;

  HomeModel(this.currentOption, this.loading, this.user);

  HomeModel copyWith({
    int? currentOption,
    bool? loading,
    UserModel? user,
  }) {
    return HomeModel(
      currentOption ?? this.currentOption,
      loading ?? this.loading,
      user ?? this.user,
    );
  }
}
