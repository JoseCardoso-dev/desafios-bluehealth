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
      fontFamily: 'Open Sans',
      colorScheme: ColorScheme.fromSeed(
        primary: const Color(0xFF0035da),
        secondary: const Color(0xFF8da5ee),
        tertiary: Colors.grey[700],
        background: const Color(0xFFFFFFFF),
        seedColor: Colors.deepPurple,
        onSecondary: const Color(0xFF08DBC6),
      ),
      scaffoldBackgroundColor: Colors.white,
      textTheme: TextTheme(
        bodyMedium: TextStyle(
          fontSize: 15 * responsiveUltils.getTextScale(context),
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        titleLarge: TextStyle(
          fontSize: 22 * responsiveUltils.getTextScale(context),
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        titleSmall: TextStyle(
          fontSize: 18 * responsiveUltils.getTextScale(context),
          color: Colors.grey[700],
          fontWeight: FontWeight.bold,
        ),
        bodySmall: TextStyle(
          fontSize: 12 * responsiveUltils.getTextScale(context),
          color: Colors.grey[700],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
