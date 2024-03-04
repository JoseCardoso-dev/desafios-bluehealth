import 'package:desafio_bluehealth/app/model/option_model.dart';
import 'package:flutter/material.dart';

class OptionItem extends StatelessWidget {
  final Option option;
  const OptionItem({
    Key? key,
    required this.option,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 72,
          width: 72,
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            shape: BoxShape.circle,
          ),
          child: Image.asset(
            'assets/${option.image}',
          ),
        ),
        const SizedBox(height: 10),
        Text(
          option.name.toUpperCase(),
          style: TextStyle(
            letterSpacing: 1.5,
            color: Theme.of(context).colorScheme.background,
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        )
      ],
    );
  }
}
