import 'package:flutter/material.dart';

import 'package:islami/screens/quran/suraName.dart';
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
            const Divider(color: Color(0xffB7935F), thickness: 2, height: 0),
            Expanded(
                flex: 6,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                            child: Container(
                          decoration: const BoxDecoration(
                              border: Border(
                            right:
                                BorderSide(color: Color(0xffB7935F), width: 1),
                            left:
                                BorderSide(color: Color(0xffB7935F), width: 2),
                            bottom:
                                BorderSide(color: Color(0xffB7935F), width: 2),
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
                          decoration: const BoxDecoration(
                              border: Border(
                            right:
                                BorderSide(color: Color(0xffB7935F), width: 2),
                            left:
                                BorderSide(color: Color(0xffB7935F), width: 1),
                            bottom:
                                BorderSide(color: Color(0xffB7935F), width: 2),
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
                            return const Divider(
                                color: Color(0xffB7935F),
                                thickness: 1,
                                height: 0);
                          },
                          itemCount: suraList.length,
                          itemBuilder: (ctx, index) {
                            return SuraInfo(
                              suraInfo: suraList[index],
                            );
                          }),
                    ),
                  ],
                )),
          ],
        ));
  }
}
