import 'package:flutter/material.dart';
import 'package:islami/core/theme.dart';
import 'package:islami/models/theme_model.dart';
import 'package:islami/screens/ahadeth/entity/hadethInfo.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HadethDetailScreen extends StatelessWidget {
  static String routeName = '/HadethDetailScreen';

  const HadethDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    HadethInfo hadethInfo =
        ModalRoute.of(context)?.settings.arguments as HadethInfo;
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(themeProvider.getBackground()),
              fit: BoxFit.fill)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            hadethInfo.hadethTitle,
            style: theme.textTheme.headline5,
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  // Expanded(flex: 3, child: Image.asset('assets/images/moshaf.png')),
                  const SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 20),
                    child: Text(
                      hadethInfo.hadethContent,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.subtitle1,
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
