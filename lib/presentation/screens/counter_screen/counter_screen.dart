import 'package:flutter/material.dart';

import '../../../logic/stores/counter_store.dart';
import 'widgets/plasma_background.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({@required this.counterStore});

  final CounterStore counterStore;

  @override
  _CounterScreenState createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          const PlasmaBackground(),
        ],
      ),
    );
  }
}