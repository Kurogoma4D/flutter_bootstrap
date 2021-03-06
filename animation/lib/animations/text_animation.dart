import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/utils.dart';

class DelayedCurve extends Curve {
  const DelayedCurve();

  @override
  double transform(double t) {
    return (t.clamp(0.2, 0.8) - 0.2) / 0.6;
  }
}

class TextAnimationDesktop extends StatefulWidget {
  const TextAnimationDesktop({Key key}) : super(key: key);

  @override
  _TextAnimationDesktopState createState() => _TextAnimationDesktopState();
}

class _TextAnimationDesktopState extends State<TextAnimationDesktop>
    with TickerProviderStateMixin {
  AnimationController _primaryController;
  Animation<double> _primaryAnimation;

  final primary = 'あの星を 掴むのはだぁれ？'.split('');

  double _opacity = 1;

  @override
  void initState() {
    super.initState();
    _primaryController = AnimationController(
      duration: const Duration(milliseconds: 3500),
      vsync: this,
    );
    _primaryAnimation = Tween<double>(begin: 0, end: primary.length.toDouble())
        .chain(CurveTween(curve: const DelayedCurve()))
        .animate(_primaryController)
          ..addListener(() => setState(() {}))
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _opacity = 0;
              Future.delayed(const Duration(milliseconds: 2000)).then((_) =>
                  context.read<AnimationManager>().state = AnimationState.MAIN);
            }
          });

    _primaryController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _opacity,
      duration: const Duration(milliseconds: 650),
      child: Row(children: <Widget>[
        for (int i = 0; i < primary.length; i++)
          AnimatedOpacity(
            duration: const Duration(milliseconds: 350),
            opacity: _primaryAnimation.value > i.toDouble() ? 1 : 0,
            child: Text(
              primary[i],
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.white,
                letterSpacing: 1.6,
              ),
            ),
          ),
      ]),
    );
  }

  @override
  void dispose() {
    _primaryController.dispose();
    super.dispose();
  }
}
