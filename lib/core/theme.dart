import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';



const ColorScheme kColorScheme = ColorScheme(
  primary: kPrimary,
  onPrimary: kPrimaryMore,
  primaryContainer: kPrimary,

  secondary: kSecondary,
  onSecondary: kDarkBgLight,
  secondaryContainer: kSecondary,

  surface: kGrey300,
  onSurface: kDarkBgLight,

  background: kGrey300,
  onBackground: kDarkBgLight,

  error: kErrorRed,
  onError: kSurfaceWhite,

  brightness: Brightness.light,
);


TextTheme _buildTextTheme(
    TextTheme base,
    String language, [
      String fontFamily = 'Roboto',
      String fontHeader = 'Raleway',
    ]) {
  return base
      .copyWith(
    headline1: GoogleFonts.getFont(
      fontHeader,
      textStyle: base.headline1?.copyWith(
        fontWeight: FontWeight.w700,
      ),
    ),
    headline2: GoogleFonts.getFont(
      fontHeader,
      textStyle: base.headline1?.copyWith(fontWeight: FontWeight.w700),
    ),
    headline3: GoogleFonts.getFont(
      fontHeader,
      textStyle: base.headline3?.copyWith(fontWeight: FontWeight.w700),
    ),
    headline4: GoogleFonts.getFont(
      fontHeader,
      textStyle: base.headline4?.copyWith(fontWeight: FontWeight.w700),
    ),
    headline5: GoogleFonts.getFont(
      fontHeader,
      textStyle: base.headline5?.copyWith(fontWeight: FontWeight.w500),
    ),
    headline6: GoogleFonts.getFont(
      fontHeader,
      textStyle: base.headline6?.copyWith(fontSize: 18.0),
    ),
    caption: GoogleFonts.getFont(
      fontFamily,
      textStyle: base.caption
          ?.copyWith(fontWeight: FontWeight.w400, fontSize: 14.0),
    ),
    subtitle1: GoogleFonts.getFont(
      fontFamily,
      textStyle: base.subtitle1?.copyWith(),
    ),
    subtitle2: GoogleFonts.getFont(
      fontFamily,
      textStyle: base.subtitle2?.copyWith(),
    ),
    bodyText1: GoogleFonts.getFont(
      fontFamily,
      textStyle: base.bodyText1?.copyWith(),
    ),
    bodyText2: GoogleFonts.getFont(
      fontFamily,
      textStyle: base.bodyText1?.copyWith(),
    ),
    button: GoogleFonts.getFont(
      fontFamily,
      textStyle: base.button
          ?.copyWith(fontWeight: FontWeight.w400, fontSize: 14.0),
    ),
  )
      .apply(
    displayColor: kPrimaryMore,
    bodyColor: kPrimaryMore,
  );
}

ThemeData lightTheme(String language,
    [String fontFamily = 'Roboto', String fontHeader = 'Raleway']) {

  final base = ThemeData.light().copyWith(
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: FadeThroughPageTransitionsBuilder(),
        TargetPlatform.iOS: FadeThroughPageTransitionsBuilder(),
      },
    ),
  );

  return base.copyWith(
    brightness: Brightness.light,
    unselectedWidgetColor: Colors.grey,
    toggleableActiveColor: kPrimary,
    buttonTheme:  const ButtonThemeData(
        colorScheme: kColorScheme,
        textTheme: ButtonTextTheme.normal,
        buttonColor: kDarkBG),
    textTheme: _buildTextTheme(base.textTheme, language, fontFamily, fontHeader),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme, language),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: kPrimaryMore,
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(
        color: kLightAccent,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: kPrimary,
      selectedItemColor: kDarkBG,
      unselectedItemColor: kWhite,
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black,
      labelPadding: EdgeInsets.zero,
      labelStyle: TextStyle(fontSize: 13),
      unselectedLabelStyle: TextStyle(fontSize: 13),
    ),
    colorScheme: kColorScheme,
  );
}

ThemeData darkTheme(String language,
    [String fontFamily = 'Roboto', String fontHeader = 'Raleway']) {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme, language, fontFamily, fontHeader).apply(
      displayColor: kLightBG,
      bodyColor: kLightBG,
    ),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme, language, fontFamily, fontHeader).apply(
      displayColor: kLightBG,
      bodyColor: kLightBG,
    ),
    brightness: Brightness.dark,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
    color: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: kGrey300,
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(
        color: kDarkAccent,
      ),
    ),
    buttonTheme: ButtonThemeData(
        colorScheme: kColorScheme.copyWith(brightness: Brightness.dark)),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white,
      labelPadding: EdgeInsets.zero,
      labelStyle: TextStyle(fontSize: 13),
      unselectedLabelStyle: TextStyle(fontSize: 13),
    ),
    colorScheme: kColorScheme.copyWith(brightness: Brightness.dark),
  );
}