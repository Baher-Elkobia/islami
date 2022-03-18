import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:islami/core/theme.dart';
import 'package:islami/models/theme_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'entity/suraInfo.dart';

class SuraDetailScreen extends StatelessWidget {
  static String routeName = '/SuraDetailScreen';

  const SuraDetailScreen({Key? key}) : super(key: key);

  String prepareSura(String sura) {
    List<String> ayatList = sura.trim().split('\n');
    String fullSura = '';

    for (var i = 0; i < ayatList.length; i++) {
      fullSura += '${ayatList[i]} (${i + 1}) ';
    }
    return fullSura;
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    SuraInfo suraInfo = ModalRoute.of(context)?.settings.arguments as SuraInfo;
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(themeProvider.getBackground()),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text('سوره ${suraInfo.suraName}', style: theme.textTheme.headline5,),
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
                          style: theme.textTheme.subtitle1,
                        )),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
