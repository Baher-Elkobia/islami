import 'package:flutter/material.dart';
import 'package:islami/screens/ahadeth/entity/hadethInfo.dart';
import 'package:islami/screens/ahadeth/hadethDetailScreen.dart';

class HadethItem extends StatelessWidget {
  final HadethInfo hadethinfo;

  const HadethItem({Key? key, required this.hadethinfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return InkWell(
      onTap: () async{
        Navigator.pushNamed(context, HadethDetailScreen.routeName, arguments: hadethinfo);
      },
      child: Container(
        height: 45,
        decoration: const BoxDecoration(
            border: Border(
              left: BorderSide(color: Color(0xffB7935F), width: 1),
              right: BorderSide(color: Color(0xffB7935F), width: 1),
            )),
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Text(
            hadethinfo.hadethTitle,
            style: theme.textTheme.headline6,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
