import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'root_page_controller.dart';
import 'utils/animation_manager.dart';
import 'root_page_controller.dart';
import 'sections/sections.dart';

class RootPage extends StatelessWidget {
  const RootPage._({Key key}) : super(key: key);

  static Widget wrapped() {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AnimationManager()),
        ChangeNotifierProvider(
            create: (context) => RootPageController(locator: context.read))
      ],
      child: const RootPage._(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select((RootPageController c) => c.isLoading);
    return Scaffold(
      backgroundColor: Color(0xff161616),
      body: isLoading
          ? Center(child: const CircularProgressIndicator())
          : const AnimationSwitch(),
    );
  }
}

class AnimationSwitch extends StatelessWidget {
  const AnimationSwitch({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.select((AnimationManager manager) => manager.state);
    switch (state) {
      case AnimationState.INIT:
        return InitSection.wrapped();

      case AnimationState.MAIN:
        return const MainSection();

      case AnimationState.END:
        return Container();

      default:
        return Container();
    }
  }
}
