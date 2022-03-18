import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/theme.dart';
import 'package:islami/core/utils.dart';
import 'package:islami/screens/ahadeth/hadethItem.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'entity/hadethInfo.dart';

class AhadethScreen extends StatefulWidget {
  const AhadethScreen({Key? key}) : super(key: key);

  @override
  State<AhadethScreen> createState() => _AhadethScreenState();
}

class _AhadethScreenState extends State<AhadethScreen> {
  List<HadethInfo> hadethList = [];

  getHadethList() async {
    String data = await rootBundle.loadString('assets/hadeth/ahadeth.txt');
    List<String> temp = [];
    temp = data.split('#');
    for (var i = 0; i < temp.length; i++) {
      List body = temp[i].trim().split('\n');
      String title = body[0];
      body.removeAt(0);
      String content = body.join('\n');
      HadethInfo hadethData = HadethInfo(
          hadethContent: content, hadethTitle: title, hadethNumber: i + 1);
      print(hadethData);
      hadethList.add(hadethData);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    if (hadethList.isEmpty) {
      getHadethList();
    }
    return hadethList.isEmpty
        ? const CircularProgressIndicator()
        : SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 1),
              child: Column(
                children: [
                  Expanded(
                      flex: 3,
                      child: Image.asset('assets/images/hadeth_logo.png')),
                  const SizedBox(height: 5),
                  Divider(color: kColorScheme.primary, thickness: 1.5, height: 0),
                  Expanded(
                      flex: 6,
                      child: ListView.separated(
                          separatorBuilder: (ctx, index) {
                            return Center(
                              child: Container(
                                  width: SizeConfig.safeBlockVertical * 50,
                                  decoration: const BoxDecoration(
                                      border: Border(
                                    bottom: BorderSide(
                                        color: Color(0xffB7935F), width: 1),
                                  ))),
                            );
                          },
                          itemCount: hadethList.length,
                          itemBuilder: (ctx, index) {
                            return InkWell(
                              onTap: () {},
                              child: HadethItem(hadethinfo: hadethList[index]),
                            );
                          })),
                ],
              ),
            ));
  }
}
