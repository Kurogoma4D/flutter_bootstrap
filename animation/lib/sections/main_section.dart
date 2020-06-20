import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class MainSection extends StatelessWidget {
  const MainSection({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OrientationLayoutBuilder(
      landscape: (context) => Container(),
      portrait: (context) => Container(),
    );
  }
}
