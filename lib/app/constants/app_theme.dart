import 'package:desafio_bluehealth/app/src/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

/// Classe para customizar o tema do aplicativo.
///
/// Customização do tema global do aplicativo, como cores, estilos de widgets,
/// estilos de textos entre outros detalhes relacionados ao tema e estilo.

class AppTheme {
  static final AppTheme instance = AppTheme._();
  AppTheme._();

  final ResponsiveUltils responsiveUltils = ResponsiveUltils();

  ThemeData appTheme(BuildContext context) {
    return ThemeData(
      fontFamily: 'Poppins',
      colorScheme: ColorScheme.fromSeed(
        primary: const Color(0xFF09A5FF),
        secondary: const Color(0xFF0035da),
        tertiary: const Color(0xFFA0A0A0),
        background: const Color(0xFFFFFFFF),
        onBackground: const Color.fromARGB(255, 0, 0, 0),
        seedColor: Colors.deepPurple,
        onSecondary: const Color(0xFF08DBC6),
      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        titleLarge: TextStyle(
          fontSize: 22 * responsiveUltils.getTextScale(context),
          color: Theme.of(context).colorScheme.background,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: TextStyle(
          fontSize: 18 * responsiveUltils.getTextScale(context),
          color: Theme.of(context).colorScheme.secondary,
          fontWeight: FontWeight.bold,
        ),
        bodyMedium: TextStyle(
          fontSize: 14 * responsiveUltils.getTextScale(context),
          color: Theme.of(context).colorScheme.background,
          fontWeight: FontWeight.bold,
        ),
        bodySmall: TextStyle(
          fontSize: 12 * responsiveUltils.getTextScale(context),
          color: Theme.of(context).colorScheme.background,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
