import 'package:daily_class_project/ageSlider.dart';
import 'package:daily_class_project/getxTest/getx.dart';
import 'package:daily_class_project/getxTest/ui.dart';
import 'package:daily_class_project/page_1.dart';
import 'package:daily_class_project/textFildToShowText/textFildtUi.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home:
      MyPage(),

      // ImageSliderPage(),
      // HomePage(),
      // GenderScreen(),

      // HomeScreen(),
    );
  }
}
