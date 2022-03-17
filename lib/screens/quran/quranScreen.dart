import 'package:flutter/material.dart';
import 'package:islami/core/theme.dart';

import 'package:islami/screens/quran/suraItem.dart';
import 'package:islami/core/consts.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Expanded(flex: 3, child: Image.asset('assets/images/moshaf.png')),
            const SizedBox(height: 20),
            Divider(color: kColorScheme.primary, thickness: 2, height: 0),
            Expanded(
                flex: 6,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                            right:
                                BorderSide(color: kColorScheme.primary, width: 1),
                            left:
                                BorderSide(color: kColorScheme.primary, width: 2),
                            bottom:
                                BorderSide(color: kColorScheme.primary, width: 2),
                          )),
                          width: double.infinity,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              'No of Ayas',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )),
                        Expanded(
                            child: Container(
                          decoration: BoxDecoration(
                              border: Border(
                            right:
                                BorderSide(color: kColorScheme.primary, width: 2),
                            left:
                                BorderSide(color: kColorScheme.primary, width: 1),
                            bottom:
                                BorderSide(color: kColorScheme.primary, width: 2),
                          )),
                          width: double.infinity,
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 10.0),
                            child: Text(
                              'Sura Name',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )),
                      ],
                    ),
                    Expanded(
                      child: ListView.separated(
                          separatorBuilder: (ctx, index) {
                            return Divider(
                                color: kColorScheme.primary,
                                thickness: 1,
                                height: 0);
                          },
                          itemCount: suraList.length,
                          itemBuilder: (ctx, index) {
                            return SuraItem(
                              suraMap: suraList[index],
                            );
                          }),
                    ),
                  ],
                )),
          ],
        ));
  }
}
