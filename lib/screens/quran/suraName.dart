import 'package:flutter/material.dart';

class SuraInfo extends StatelessWidget {
  Map<String, String> suraInfo;

  SuraInfo({Key? key, required this.suraInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                suraInfo['ayat']!,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
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
                suraInfo['name']!,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
          )),
        ],
      ),
    );
  }
}
