import 'package:animate_do/animate_do.dart';
import 'package:desafio_bluehealth/app/src/utils/responsive_utils.dart';
import 'package:flutter/material.dart';

class ElementLogin extends StatelessWidget {
  final ResponsiveUltils responsiveUltils = ResponsiveUltils();
  final double? left;
  final double? right;
  final double top;
  final double width;
  final double height;
  final String imagePath;
  final int fadeInDuration;

  ElementLogin({
    super.key,
    this.left,
    this.right,
    required this.top,
    required this.width,
    required this.height,
    required this.imagePath,
    required this.fadeInDuration,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: left != null
          ? responsiveUltils.getHeightSpacing(context, left!)
          : null,
      right: right != null
          ? responsiveUltils.getHeightSpacing(context, right!)
          : null,
      top: top * responsiveUltils.getImageScale(context),
      width: responsiveUltils.getHeightSpacing(context, width),
      height: responsiveUltils.getHeightSpacing(context, height),
      child: FadeInUp(
        duration: Duration(milliseconds: fadeInDuration),
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
            ),
          ),
        ),
      ),
    );
  }
}
