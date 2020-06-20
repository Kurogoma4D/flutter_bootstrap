import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RootPageController extends ChangeNotifier {
  RootPageController({this.locator}) {
    initialize();
  }

  final Locator locator;
  bool _isLoading = true;
  bool get isLoading => _isLoading;

  void initialize() async {
    final context =
        locator<GlobalKey<NavigatorState>>().currentState.overlay.context;

    final numbers = List.generate(40, (index) => index + 1);
    numbers.shuffle();

    /// 画像プリロードなど初期化処理
    await Future.delayed(const Duration(seconds: 1));

    _isLoading = false;
    notifyListeners();
  }
}
