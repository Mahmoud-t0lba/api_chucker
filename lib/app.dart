import 'package:flutter/material.dart';

import 'base_screen.dart';
import 'chucker_flutter.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorObservers: [ChuckerFlutter.navigatorObserver],
      home: const TodoPage(),
    );
  }
}
