import 'package:flutter/cupertino.dart' show CupertinoIcons;
import 'package:flutter/material.dart';
import 'package:islami/models/lang_model.dart';
import 'package:islami/models/theme_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingScreen extends StatefulWidget {
  static String routeName = '/settings';

  const SettingScreen();

  @override
  SettingScreenState createState() {
    return SettingScreenState();
  }
}

class SettingScreenState extends State<SettingScreen> {
  var languageItems = [
    'العربيه',
    'English',
  ];

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LangProvider langProvider = Provider.of<LangProvider>(context);

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            expandedHeight: 170,
            title: Text(AppLocalizations.of(context)!.settings),
            flexibleSpace: FlexibleSpaceBar(
              background: Center(
                  child: Container(
                      margin: const EdgeInsets.only(top: 45),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white70,
                      ),
                      child:
                          Image.asset('assets/images/logo.png', height: 110))),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                // Language Setting
                //---------------
                Card(
                  margin: const EdgeInsets.only(bottom: 2.0),
                  elevation: 0,
                  child: ListTile(
                    leading: const Icon(Icons.language),
                    title: Text(AppLocalizations.of(context)!.language),
                    trailing: DropdownButton<String>(
                      value: langProvider.lang == 'ar'
                          ? languageItems[0]
                          : languageItems[1],
                      underline: Container(),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      items: languageItems.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(items),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        if (newValue == 'العربيه') {
                          langProvider.changeLanguage(lang: 'ar');
                        } else {
                          langProvider.changeLanguage(lang: 'en');
                        }
                      },
                    ),
                  ),
                ),
                // Theme Setting
                //---------------
                Card(
                  margin: const EdgeInsets.only(bottom: 2.0),
                  elevation: 0,
                  child: SwitchListTile(
                    secondary: Icon(
                      themeProvider.mode == ThemeMode.light
                          ? CupertinoIcons.sun_min
                          : CupertinoIcons.moon,
                      color: Theme.of(context).colorScheme.secondary,
                      size: 24,
                    ),
                    value: themeProvider.mode == ThemeMode.dark ? true : false,
                    activeColor: const Color(0xFF0066B4),
                    onChanged: (bool value) {
                      if (value) {
                        themeProvider.changeTheme(mode: ThemeMode.dark);
                      } else {
                        themeProvider.changeTheme(mode: ThemeMode.light);
                      }
                    },
                    title: Text(
                      AppLocalizations.of(context)!.darkMode,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
