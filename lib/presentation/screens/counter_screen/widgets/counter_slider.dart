import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:sizer/sizer.dart';

import '../../../../logic/stores/counter_store.dart';

class CounterSlider extends StatefulWidget {
  const CounterSlider({@required this.counter});

  final CounterStore counter;

  @override
  _CounterSliderState createState() => _CounterSliderState();
}

class _CounterSliderState extends State<CounterSlider> with SingleTickerProviderStateMixin {
  static const Offset _beginTween = Offset(0.0, 0.0);
  static const Offset _endTween = Offset(1.5, 0.0);

  double _startAnimationPosX;
  Animation<Offset> _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this, lowerBound: -0.5, upperBound: 0.5);
    _controller.value = 0.0;
    _controller.addListener(() {});

    _animation = Tween<Offset>(begin: _beginTween, end: _endTween).animate(_controller);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(CounterSlider oldWidget) {
    super.didUpdateWidget(oldWidget);
    _animation = Tween<Offset>(begin: _beginTween, end: _endTween).animate(_controller);
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: SizedBox(
        width: SizerUtil.deviceType == DeviceType.tablet ? 40.0.w : 55.0.w,
        height: 12.0.h,
        child: Material(
          clipBehavior: Clip.antiAlias,
          borderRadius: BorderRadius.circular(60.0),
          color: Theme.of(context).accentColor.withOpacity(0.2),
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                left: 10.0,
                child: Icon(
                  Icons.remove,
                  size: SizerUtil.deviceType == DeviceType.tablet
                      ? 7.0.w
                      : 10.0.w,
                  color: Theme.of(context).iconTheme.color.withOpacity(0.7),
                ),
              ),
              Positioned(
                right: 10.0,
                child: Icon(
                  Icons.add,
                  size: SizerUtil.deviceType == DeviceType.tablet
                      ? 7.0.w
                      : 10.0.w,
                  color: Theme.of(context).iconTheme.color.withOpacity(0.7),
                ),
              ),
              GestureDetector(
                onHorizontalDragStart: _onPanStart,
                onHorizontalDragUpdate: _onPanUpdate,
                onHorizontalDragEnd: _onPanEnd,
                child: SlideTransition(
                  position: _animation,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Material(
                      color: Theme.of(context).accentColor,
                      shape: const CircleBorder(),
                      elevation: 5.0,
                      child: Center(
                        child: Icon(
                          Icons.trip_origin,
                          size: SizerUtil.deviceType == DeviceType.tablet
                              ? 7.0.w
                              : 10.0.w,
                          color: Theme.of(context).iconTheme.color.withOpacity(0.6),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onPanStart(DragStartDetails details) {
    _controller.stop();
    _controller.value = offsetFromGlobalPos(details.globalPosition);
  }

  void _onPanUpdate(DragUpdateDetails details) {
    _controller.value = offsetFromGlobalPos(details.globalPosition);
  }

  void _onPanEnd(DragEndDetails details) {
    _controller.stop();

    if (_controller.value <= -0.20) {
      widget.counter.decrement();
    } else if (_controller.value >= 0.20) {
      widget.counter.increment();
    }

    final SpringDescription _kDefaultSpring = SpringDescription
        .withDampingRatio(mass: 0.9, stiffness: 250.0, ratio: 0.6);

    _controller.animateWith(
        SpringSimulation(_kDefaultSpring, _startAnimationPosX, 0.0, 0.0));
  }

  double offsetFromGlobalPos(Offset globalPosition) {
    final RenderBox box = context.findRenderObject() as RenderBox;
    final Offset local = box.globalToLocal(globalPosition);

    _startAnimationPosX = ((local.dx * 0.75) / box.size.width) - 0.4;

    return ((local.dx * 0.75) / box.size.width) - 0.4;
  }
}