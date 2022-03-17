import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/core/theme.dart';
import 'package:islami/screens/ahadeth/hadethItem.dart';

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
    if (hadethList.isEmpty) {
      getHadethList();
    }
    return hadethList.isEmpty
        ? const CircularProgressIndicator()
        : SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Expanded(
                    flex: 3, child: Image.asset('assets/images/hadeth_logo.png')),
                const SizedBox(height: 20),
                Divider(color: kColorScheme.primary, thickness: 2, height: 0),
                Expanded(
                    flex: 6,
                    child: ListView.separated(
                        separatorBuilder: (ctx, index) {
                          return Divider(
                              color: kColorScheme.primary,
                              thickness: 1,
                              height: 0);
                        },
                        itemCount: hadethList.length,
                        itemBuilder: (ctx, index) {
                          return InkWell(
                            onTap: () {

                            },
                            child: HadethItem(Hadethinfo: hadethList[index]),
                          );
                        })),
              ],
            ));
  }
}
