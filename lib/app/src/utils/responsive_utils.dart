import 'package:flutter/material.dart';

/// Classe para aplicar responsividade no aplicativo.
///
/// Esta classe fornece métodos para calcular escalas e espaçamentos
/// com base em um mockup de design. Ela é especialmente útil para
/// garantir que o aplicativo seja responsivo em diferentes tamanhos
/// de tela.

class ResponsiveUltils {
  final int _mockupWidth = 390;
  final int _mockupHeight = 844;

  double getTextScale(BuildContext context) {
    final double phoneWidth = MediaQuery.of(context).size.width;
    return phoneWidth / _mockupWidth;
  }

  double getImageScale(BuildContext context) {
    final double phoneWidth = MediaQuery.of(context).size.width;
    return _mockupWidth / phoneWidth;
  }

  double getHeightSpacing(BuildContext context, double heightSpacing) {
    final double phoneHeight = MediaQuery.of(context).size.height;
    return heightSpacing / _mockupHeight * phoneHeight;
  }

  double getWidthSpacing(BuildContext context, double widthSpacing) {
    final double phoneWidth = MediaQuery.of(context).size.width;
    return widthSpacing / _mockupHeight * phoneWidth;
  }
}
