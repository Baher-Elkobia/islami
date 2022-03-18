import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/screens/quran/suraDetailScreen.dart';

import 'entity/suraInfo.dart';

class SuraItem extends StatelessWidget {
  Map<String, dynamic> suraMap;

  SuraItem({Key? key, required this.suraMap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return InkWell(
      onTap: () async{
        SuraInfo sura = await getSuraContent(no:suraMap['no']);
        Navigator.pushNamed(context, SuraDetailScreen.routeName, arguments: sura);
      },
      child: Container(
        alignment: Alignment.center,
        child: Row(
          children: [
            Expanded(
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
                  suraMap['ayat']!,
                  style: theme.textTheme.subtitle1,
                  textAlign: TextAlign.center,
                ),
              ),
            )),
            Expanded(
                child: Container(
                  height: 45,
              decoration: const BoxDecoration(
                  border: Border(
                right: BorderSide(color: Color(0xffB7935F), width: 1),
                left: BorderSide(color: Color(0xffB7935F), width: 1),
              )),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  suraMap['name']!,
                  style: theme.textTheme.subtitle1,
                  textAlign: TextAlign.center,
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }

  Future<SuraInfo> getSuraContent({required int no}) async{
    String content =  await rootBundle.loadString('assets/suras/$no.txt');
    print('content: $content');
    return SuraInfo(suraNumber: no, suraName: suraMap['name'], suraContent: content);
  }
}
