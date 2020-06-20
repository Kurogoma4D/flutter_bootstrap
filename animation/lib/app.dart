import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'root_page.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final navigatorKey = GlobalKey<NavigatorState>();
    return Provider<GlobalKey<NavigatorState>>.value(
      value: navigatorKey,
      child: MaterialApp(
        // TODO(Kurogoma4D): change title.
        title: 'アニメーションサンプル',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('ja', ''), // English, no country code
        ],
        navigatorKey: navigatorKey,
        home: RootPage.wrapped(),
      ),
    );
  }
}
