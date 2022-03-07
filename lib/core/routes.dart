import 'package:flutter/material.dart';
import 'package:islami/screens/homeScreen.dart';

class RouteGenerator {
  static Map<String, Widget Function(BuildContext)> generateRoutes() {
    return {HomeScreen.routeName: (context) => HomeScreen()};
  }
}
