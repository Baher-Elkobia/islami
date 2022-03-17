import 'package:flutter/material.dart';
import 'package:islami/core/theme.dart';
import 'package:islami/screens/ahadeth/entity/hadethInfo.dart';


class HadethDetailScreen extends StatelessWidget {
  static String routeName = '/HadethDetailScreen';
  const HadethDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HadethInfo hadethInfo = ModalRoute.of(context)?.settings.arguments as HadethInfo;

    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/defaultBackground.png'),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(title: Text(hadethInfo.hadethTitle),centerTitle: true,),
        body: SingleChildScrollView(
          child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  // Expanded(flex: 3, child: Image.asset('assets/images/moshaf.png')),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                    child: Text(hadethInfo.hadethContent, textAlign: TextAlign.center,),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
