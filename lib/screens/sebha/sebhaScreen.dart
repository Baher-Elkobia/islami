import 'package:flutter/material.dart';

import '../../core/colors.dart';
import '../../core/theme.dart';

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
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              GestureDetector(
                onTap: () {
                  counter++;
                  angle++;
                  if (counter % 33 == 0) {
                    if (index == 4) {
                      index = 0;
                    } else {
                      index++;
                    }
                  }
                  setState(() {});
                },
                child: Container(
                    height: 180,
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.1),
                    child: Transform.rotate(
                      angle: angle,
                        child: Image.asset('assets/images/body_sebha.png'))),
              ),
              Image.asset('assets/images/head_sebha.png'),
            ],
          ),
          const SizedBox(
            height: 15,
          ),
          const Text("عدد التسبيحات", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500)),
          const SizedBox(
            height: 15,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: kColorScheme.secondary,
            ),
            child: Text(
              counter.toString(),
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 25),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 13),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: kColorScheme.primary,
            ),
            child: Text(
              tasbehList[index].toString(),
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: kSurfaceWhite),
            ),
          )
        ],
      ),
    );
  }
}
