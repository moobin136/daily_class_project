import 'package:flutter/material.dart';

import 'login_atiticaiton/Presentation/screen/login_screen.dart';
import 'package:get/get.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en'), // English
        Locale('es'), // Spanish
      ],

      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
