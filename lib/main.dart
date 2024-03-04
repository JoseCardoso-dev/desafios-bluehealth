import 'package:desafio_bluehealth/app/config/hive_config.dart';
import 'package:desafio_bluehealth/app/constants/app_theme.dart';
import 'package:desafio_bluehealth/app/view/login/login_view.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveConfig.start();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meu Saúde Blue',
      theme: AppTheme.instance.appTheme(context),
      home: const LoginView(),
    );
  }
}
