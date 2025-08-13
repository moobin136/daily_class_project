import 'package:flutter/material.dart';

import 'gender/gender_screen/gender_controller/gender_controller.dart';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: GenderController(),
    );
  }
}
