import 'package:flutter/material.dart';
import 'package:islami/screens/ahadeth/hadethDetailScreen.dart';
import 'package:islami/screens/homeScreen.dart';
import 'package:islami/screens/quran/suraDetailScreen.dart';
import 'package:islami/screens/settingsScreen.dart';

class RouteGenerator {
  static Map<String, Widget Function(BuildContext)> generateRoutes() {
    return {
      HomeScreen.routeName: (context) => HomeScreen(),
      SettingScreen.routeName: (context) => SettingScreen(),
      SuraDetailScreen.routeName: (context) => SuraDetailScreen(),
      HadethDetailScreen.routeName: (context) => HadethDetailScreen(),
    };
  }
}
