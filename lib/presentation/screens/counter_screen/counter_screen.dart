import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../logic/stores/counter_store.dart';
import 'widgets/animated_circles.dart';
import 'widgets/counter_slider.dart';
import 'widgets/counter_value.dart';
import 'widgets/plasma_background.dart';

class CounterScreen extends StatelessWidget {
  CounterScreen({required this.counterStore}) {
    counterStore.loadValue();
  }

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
          Positioned(
            bottom: 5.0.h,
            child: CounterSlider(counter: counterStore),
          ),
        ],
      ),
    );
  }
}