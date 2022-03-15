import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:islami/core/routes.dart';
import 'package:islami/screens/splash.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'core/theme.dart';
import 'models/lang_model.dart';
import 'models/theme_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<ThemeProvider>(create: (_) => ThemeProvider()),
      ChangeNotifierProvider<LangProvider>(create: (_) => LangProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ThemeProvider themeProvider = Provider.of<ThemeProvider>(context);
    LangProvider langProvider = Provider.of<LangProvider>(context);

    return MaterialApp(
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('ar', ''),
      ],
      locale: Locale(langProvider.lang, ""),
      title: 'Islami',
      theme: lightTheme('ENG'),
      darkTheme: darkTheme('ENG'),
      themeMode: themeProvider.mode,
      home: MyCustomSplashScreen(),
      routes: RouteGenerator.generateRoutes(),
      // initialRoute: HomeScreen.routeName,
    );
  }
}
