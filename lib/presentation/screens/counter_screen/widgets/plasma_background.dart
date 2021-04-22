import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

import '../../../../core/themes/app_theme.dart';

class PlasmaBackground extends StatelessWidget {
  const PlasmaBackground();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).backgroundColor,
        backgroundBlendMode: BlendMode.srcOver,
      ),
      child: PlasmaRenderer(
        particles: 5,
        color: Theme.of(context).particlesColor,
        blur: 0.5,
        size: 0.4,
        speed: 0.4,
        blendMode: BlendMode.plus,
      ),
    );
  }
}