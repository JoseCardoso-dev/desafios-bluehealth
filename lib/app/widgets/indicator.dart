import 'package:desafio_bluehealth/app/src/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final ResponsiveUltils responsiveUltils = ResponsiveUltils();

  Indicator({
    super.key,
    required this.color,
    required this.text,
    this.size = 25,
  });
  final Color color;
  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: responsiveUltils.getWidthSpacing(context, size),
          height: responsiveUltils.getWidthSpacing(context, size),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
          ),
        ),
        SizedBox(
          width: responsiveUltils.getWidthSpacing(context, 4),
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.bodySmall,
        )
      ],
    );
  }
}
