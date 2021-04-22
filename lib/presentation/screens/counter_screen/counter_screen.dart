import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/stores/counter_store.dart';
import 'widgets/animated_circles.dart';
import 'widgets/counter_value.dart';
import 'widgets/plasma_background.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({@required this.counterStore});

  final CounterStore counterStore;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const PlasmaBackground(),
          Positioned(
            top: 10.0.h,
            child: Stack(
              alignment: Alignment.center,
              children: [
                const AnimatedCircles(),
                CounterValue(counter: counterStore),
              ],
            ),
          ),
        ],
      ),
    );
  }
}