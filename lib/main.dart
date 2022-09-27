import 'package:flutter/material.dart';
import 'package:test/ui/home/home_page.dart';
import 'package:test/ui/navigator/navigator_page.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NavigatorPage(),
    );
  }
}
