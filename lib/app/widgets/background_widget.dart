import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Background extends StatelessWidget {
  const Background({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: const Stack(children: [
        Decoration(degress: 80, left: -50, top: 0),
        Decoration(degress: 170, left: -70, top: 150),
        Decoration(degress: 75, right: -20, top: 150),
        Decoration(degress: 100, right: -70, top: 300),
        Decoration(degress: 155, right: 70, top: 350),
      ]),
    );
  }
}

class Decoration extends StatelessWidget {
  final double? top, left, right, bottom, degress;
  const Decoration({
    Key? key,
    this.top,
    this.left,
    this.right,
    this.bottom,
    this.degress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      bottom: bottom,
      left: left,
      right: right,
      child: Transform.rotate(
        angle: degress! * pi / 180,
        child: SvgPicture.asset(
          'assets/images/homeView/decoration.svg',
          width: 150,
        ),
      ),
    );
  }
}
