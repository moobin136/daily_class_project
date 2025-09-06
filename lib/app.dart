import 'package:flutter/material.dart';

import 'futers/home/screen/home_screen.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(showSemanticsDebugger: false, home: HomeScreen());
  }
}
