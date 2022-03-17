import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:islami/core/theme.dart';

import 'entity/suraInfo.dart';

class SuraDetailScreen extends StatelessWidget {
  static String routeName = '/SuraDetailScreen';

  const SuraDetailScreen({Key? key}) : super(key: key);

  String prepareSura(String sura) {
    List<String> ayatList = sura.split('\n');
    String fullSura = '';

    for (var i = 0; i < ayatList.length; i++) {
      fullSura += '${ayatList[i]} (${i + 1}) ';
    }
    return fullSura;
  }

  @override
  Widget build(BuildContext context) {
    SuraInfo suraInfo = ModalRoute.of(context)?.settings.arguments as SuraInfo;

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/defaultBackground.png'),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(suraInfo.suraName),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    child: Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text(
                          prepareSura(suraInfo.suraContent),
                          textAlign: TextAlign.center,
                        )),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
