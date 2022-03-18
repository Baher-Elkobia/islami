import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/core/utils.dart';
import 'package:islami/models/theme_model.dart';
import 'package:islami/screens/quran/quranScreen.dart';
import 'package:islami/screens/radio/radioScreen.dart';
import 'package:islami/screens/sebha/sebhaScreen.dart';

import 'package:islami/core/theme.dart';
import 'package:islami/screens/settingsScreen.dart';
import 'package:provider/provider.dart';
import 'ahadeth/ahadethScreen.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static String routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;

  Widget getScreen() {
    if (pageIndex == 0) {
      return const QuranScreen();
    } else if (pageIndex == 1) {
      return const AhadethScreen();
    } else if (pageIndex == 2) {
      return const SebhaScreen();
    } else{
      return const RadioScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    ThemeData theme = Theme.of(context);
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(themeProvider.getBackground()),
                fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: Text(AppLocalizations.of(context)!.islami, style: Theme.of(context).textTheme.headline4?.copyWith(color: kColorScheme.primary),)
            )
          ),
          body: getScreen(),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                DrawerHeader(
                  padding: const EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.settings, color: Colors.white70,size: 30),
                      const SizedBox(width: 7),
                      Text(AppLocalizations.of(context)!.islamiSettings, style: theme.textTheme.headline6?.copyWith(color: Colors.white70)),
                    ],
                  ),
                ),
                ListTile(
                  title: Text(AppLocalizations.of(context)!.settings),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, SettingScreen.routeName);
                  },
                ),
                Divider(color: theme.colorScheme.primary,thickness: 0.5),
                ListTile(
                  title: Text(AppLocalizations.of(context)!.aboutUs),
                  onTap: () {
                    // Update the state of the app.
                    // ...
                    Navigator.pop(context);
                  },
                ),
                Divider(color: theme.colorScheme.primary,thickness: 0.5),
              ],
            ),
          ),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: kColorScheme.primary),
            child: BottomNavigationBar(
              onTap: (value) {
                pageIndex = value;
                setState(() {});
              },
              currentIndex: pageIndex,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                    icon: const ImageIcon(AssetImage('assets/images/quran.png')),
                    label: AppLocalizations.of(context)!.quran),
                BottomNavigationBarItem(
                    icon: const ImageIcon(AssetImage('assets/images/hadis.png')),
                    label: AppLocalizations.of(context)!.ahadeth),
                BottomNavigationBarItem(
                    icon: const ImageIcon(AssetImage('assets/images/sebha_blue.png')),
                    label: AppLocalizations.of(context)!.sebha),
                BottomNavigationBarItem(
                    icon: const ImageIcon(AssetImage('assets/images/radio_blue.png')),
                    label: AppLocalizations.of(context)!.radio),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
