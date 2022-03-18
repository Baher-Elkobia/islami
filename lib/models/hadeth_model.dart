import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HadethModel extends ChangeNotifier{
  List<String> hadethList = [];

  void getHadethList()async{
    String data = await rootBundle.loadString('assets/hadeth/ahadeth.txt');
    hadethList = data.split('#');
    print(hadethList);
    notifyListeners();
  }
}