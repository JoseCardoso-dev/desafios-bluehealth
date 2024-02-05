import 'package:flutter/material.dart';

/// Utilitário para transições de página personalizadas.
class TransitionPageUtils {
  /// Navega para uma nova página com uma transição de fade.
  ///
  /// [context]: O contexto da aplicação.
  /// [page]: A widget da página para a qual navegar.
  static void navigateToPage(BuildContext context, Widget page) {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => page,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = 0.0;
          const end = 1.0;
          var opacityTween = Tween(begin: begin, end: end);

          var opacityAnimation = animation.drive(opacityTween);

          return FadeTransition(
            opacity: opacityAnimation,
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 500),
      ),
    );
  }
}
