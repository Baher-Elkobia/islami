import 'package:flutter/material.dart';
import 'package:islami/core/theme.dart';

import 'package:islami/screens/quran/suraItem.dart';
import 'package:islami/core/consts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuranScreen extends StatelessWidget {
  const QuranScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 10),
          child: Column(
            children: [
              Expanded(flex: 3, child: Image.asset('assets/images/moshaf.png')),
              const SizedBox(height: 20),
              Divider(color: kColorScheme.primary, thickness: 1, height: 0),
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
                              right: BorderSide(
                                  color: kColorScheme.primary, width: 0.5),
                              left: BorderSide(
                                  color: kColorScheme.primary, width: 1),
                              bottom: BorderSide(
                                  color: kColorScheme.primary, width: 1),
                            )),
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                AppLocalizations.of(context)!.noOfAyat,
                                style: theme.textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )),
                          Expanded(
                              child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                              right: BorderSide(
                                  color: kColorScheme.primary, width: 1),
                              left: BorderSide(
                                  color: kColorScheme.primary, width: 0.5),
                              bottom: BorderSide(
                                  color: kColorScheme.primary, width: 1),
                            )),
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0),
                              child: Text(
                                AppLocalizations.of(context)!.suraName,
                                style: theme.textTheme.subtitle1?.copyWith(fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          )),
                        ],
                      ),
                      Expanded(
                        child: ListView.separated(
                            separatorBuilder: (ctx, index) {
                              return const Divider(thickness: 1, height: 0);
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
          ),
        ));
  }
}
