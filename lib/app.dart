import 'package:flutter/material.dart';

import 'api/api.dart';
import 'login_atiticaiton/Presentation/screen/login_screen.dart';
import 'package:get/get.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(debugShowCheckedModeBanner: false, home: LoginPage());
  }
}
