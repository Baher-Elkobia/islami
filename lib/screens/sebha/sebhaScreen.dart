import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:islami/core/theme.dart';
import 'package:islami/core/utils.dart';

class SebhaScreen extends StatefulWidget {
  const SebhaScreen({Key? key}) : super(key: key);

  @override
  State<SebhaScreen> createState() => _SebhaScreenState();
}

class _SebhaScreenState extends State<SebhaScreen> {
  int counter = 0;
  int index = 0;
  double angle = 0;
  List<String> tasbehList = [
    "سبحان الله",
    "الحمد لله",
    "لا اله الا الله",
    "الله اكبر",
    "لاحول والاقوه الا بالله"
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    void perfromTasbeh() {
      counter++;
      angle += 24;
      if (counter % 33 == 0) {
        if (index == 4) {
          index = 0;
        } else {
          index++;
        }
      }
    }

    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Expanded(
            flex: 6,
            child: Column(
              children: [
                Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    GestureDetector(
                      onTap: () {
                        perfromTasbeh();
                        setState(() {});
                      },
                      child: Container(
                          height: SizeConfig.safeBlockVertical * 30,
                          margin: EdgeInsets.only(
                              top: SizeConfig.safeBlockVertical * 16),
                          child: Transform.rotate(
                              angle: angle,
                              child: Image.asset(
                                'assets/images/body_sebha.png',
                              ))),
                    ),
                    Container(
                        height: SizeConfig.safeBlockVertical * 10,
                        margin: EdgeInsets.only(
                            top: SizeConfig.safeBlockVertical * 11),
                        child: Image.asset('assets/images/head_sebha.png')),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Column(
              children: [
                Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    height: SizeConfig.blockSizeVertical * 7,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: kColorScheme.primary,
                    ),
                    child: Text(
                      tasbehList[index].toString(),
                      style: GoogleFonts.reemKufi(
                        textStyle: TextStyle(
                            fontSize: SizeConfig.blockSizeHorizontal * 6,
                            fontWeight: FontWeight.w500,
                            color: kColorScheme.background),
                      ),
                    )),
                SizedBox(height: SizeConfig.blockSizeVertical * 4),
                Text(
                  "عدد التسبيحات",
                  style: GoogleFonts.reemKufi(
                    textStyle: TextStyle(
                        fontSize: SizeConfig.blockSizeVertical * 4,
                        fontWeight: FontWeight.w500,
                        color: kColorScheme.primary),
                  ),
                ),
                SizedBox(height: SizeConfig.blockSizeVertical * 3),
                Container(
                  height: SizeConfig.blockSizeVertical * 7,
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: kColorScheme.secondary,
                  ),
                  child: Text(
                    counter.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: SizeConfig.blockSizeVertical * 4,
                        fontWeight: FontWeight.bold,
                        color: kColorScheme.onPrimary),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
