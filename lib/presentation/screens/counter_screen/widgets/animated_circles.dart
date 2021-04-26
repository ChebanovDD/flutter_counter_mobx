import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:sizer/sizer.dart';

class AnimatedCircles extends StatelessWidget {
  const AnimatedCircles();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 70.0.w,
        height: 40.0.h,
        child: FlareActor('assets/flares/circle.flr',
          animation: 'Alarm',
          color: Theme.of(context).accentColor,
        )
    );
  }
}