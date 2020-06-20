import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../animations/animations.dart';

class InitSection extends StatelessWidget {
  const InitSection._({Key key}) : super(key: key);

  static Widget wrapped() {
    return MultiProvider(
      providers: [
        Provider<InitSectionController>(
          create: (context) => InitSectionController(),
          dispose: (_, controller) => controller.dispose(),
        ),
      ],
      child: const InitSection._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.8,
        child: FittedBox(
          fit: BoxFit.scaleDown,
          child: const TextAnimationDesktop(),
        ),
      ),
    );
  }
}

class InitSectionController {
  InitSectionController({this.locator});

  final Locator locator;
  final StreamController<bool> textChain = StreamController<bool>.broadcast();

  void dispose() {
    textChain.close();
  }
}
