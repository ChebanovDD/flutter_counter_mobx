import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:sizer/sizer.dart';

import '../../../../logic/stores/counter_store.dart';

class CounterValue extends StatefulWidget {
  const CounterValue({required this.counter});

  final CounterStore counter;

  @override
  _CounterValueState createState() => _CounterValueState();
}

class _CounterValueState extends State<CounterValue> {
  AnimationController? _animationController;

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      _animationController?.forward(from: 0.0);
      return ZoomIn(
        duration: const Duration(milliseconds: 400),
        manualTrigger: true,
        controller: (controller) => _animationController = controller,
        child: Text('${widget.counter.value}',
          style: Theme.of(context).textTheme.headline1!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 75.0.sp,
          ),
        ),
      );
    });
  }
}