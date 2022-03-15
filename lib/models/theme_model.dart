import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode mode = ThemeMode.light;

  void changeTheme({required ThemeMode  mode}){
    this.mode = mode;
    notifyListeners();
  }
}