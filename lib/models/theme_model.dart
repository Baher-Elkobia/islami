import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier{
  ThemeMode mode = ThemeMode.light;

  void changeTheme({required ThemeMode  mode}){
    this.mode = mode;
    notifyListeners();
  }

  String getBackground(){
    return mode == ThemeMode.light? 'assets/images/defaultBackground.png' : 'assets/images/dark_bg.png';
  }
}