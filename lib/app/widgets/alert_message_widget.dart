import 'package:flutter/material.dart';

class AlertMessageWidget {
  static void show(
    BuildContext context, {
    required String message,
  }) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
        ),
        backgroundColor: Theme.of(context).colorScheme.tertiary,
        behavior: SnackBarBehavior.floating,
        elevation: 30,
        margin: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
