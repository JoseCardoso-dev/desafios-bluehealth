import 'package:desafio_bluehealth/app/constants/app_theme.dart';
import 'package:desafio_bluehealth/app/pages/login/login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Desafio BlueHealth',
      theme: AppTheme.instance.appTheme(context),
      home: LoginPage(),
    );
  }
}
