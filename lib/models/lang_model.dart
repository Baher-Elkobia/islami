import 'package:flutter/material.dart';

class LangProvider extends ChangeNotifier{
  String lang = 'en';

  void changeLanguage({required String lang}){
    this.lang = lang;
    notifyListeners();
  }
}