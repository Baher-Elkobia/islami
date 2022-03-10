import 'package:flutter/material.dart';

import 'package:islami/screens/homeScreen.dart';
import 'package:islami/core/routes.dart';
import 'package:islami/screens/splash.dart';

import 'core/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Islami',
      theme: lightTheme('ENG'),
      darkTheme: darkTheme('ENG'),
      themeMode: ThemeMode.light,
      home: MyCustomSplashScreen(),
      routes: RouteGenerator.generateRoutes(),
      // initialRoute: HomeScreen.routeName,
    );
  }
}
