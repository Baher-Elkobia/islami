import 'package:flutter/material.dart';
import 'package:islami/screens/ahadeth/entity/hadethInfo.dart';
import 'package:islami/screens/ahadeth/hadethDetailScreen.dart';

class HadethItem extends StatelessWidget {
  HadethInfo Hadethinfo;

  HadethItem({Key? key, required this.Hadethinfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async{
        Navigator.pushNamed(context, HadethDetailScreen.routeName, arguments: Hadethinfo);
      },
      child: Container(
        height: 45,
        decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(color: Color(0xffB7935F), width: 1),
            )),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            Hadethinfo.hadethTitle,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  // Future<SuraInfo> getSuraContent({required int no}) async{
  //   String content =  await rootBundle.loadString('assets/suras/$no.txt');
  //   print('content: $content');
  //   return SuraInfo(suraNumber: no, suraName: suraMap['name'], suraContent: content);
  // }
}
