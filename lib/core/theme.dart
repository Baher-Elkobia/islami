import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';



// IconThemeData _customIconTheme(IconThemeData original) {
//   return original.copyWith(color: kGrey900);
// }

const ColorScheme kColorScheme = ColorScheme(
  primary: kGold,
  primaryContainer: kDarkBG,
  secondary: kTeal50,
  secondaryContainer: kDarkBG,
  surface: kSurfaceWhite,
  background: Colors.white,
  error: kErrorRed,
  onPrimary: kDarkBG,
  onSecondary: kDarkBG,
  onSurface: kDarkBG,
  onBackground: kDarkBG,
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

        /// If using the custom font, un-comment below and clone to other headline.., bodyText..
        /// fontFamily: 'Your-Custom-Font',
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
    displayColor: kDarkBG,
    bodyColor: kDarkBG,
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
    cardColor: Colors.white,
    unselectedWidgetColor: Colors.grey,
    toggleableActiveColor: kGold,
    errorColor: kErrorRed,
    buttonTheme: const ButtonThemeData(
        colorScheme: kColorScheme,
        textTheme: ButtonTextTheme.normal,
        buttonColor: kDarkBG),
    primaryColorLight: kLightBG,
    // primaryIconTheme: _customIconTheme(base.iconTheme),
    textTheme: _buildTextTheme(base.textTheme, language, fontFamily, fontHeader),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme, language),
    // iconTheme: _customIconTheme(base.iconTheme),
    // hintColor: Colors.black26,
    // backgroundColor: Colors.white,
    primaryColor: kLightPrimary,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: kDarkBG,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
      iconTheme: IconThemeData(
        color: kLightAccent,
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: kGold,
      selectedItemColor: kDarkBG,
      unselectedItemColor: kTeal50,
    ),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.black,
      unselectedLabelColor: Colors.black,
      labelPadding: EdgeInsets.zero,
      labelStyle: TextStyle(fontSize: 13),
      unselectedLabelStyle: TextStyle(fontSize: 13),
    ),
    colorScheme: kColorScheme.copyWith(secondary: kLightAccent),
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
    canvasColor: kDarkBG,
    cardColor: kDarkBgLight,
    brightness: Brightness.dark,
    backgroundColor: kDarkBG,
    primaryColor: kDarkBG,
    primaryColorLight: kDarkBgLight,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
    color: Colors.transparent,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: kDarkBG,
        fontSize: 18.0,
        fontWeight: FontWeight.w800,
      ),
      iconTheme: IconThemeData(
        color: kDarkAccent,
      ),
    ),
    buttonTheme: ButtonThemeData(
        colorScheme: kColorScheme.copyWith(onPrimary: kLightBG)),
    tabBarTheme: const TabBarTheme(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.white,
      labelPadding: EdgeInsets.zero,
      labelStyle: TextStyle(fontSize: 13),
      unselectedLabelStyle: TextStyle(fontSize: 13),
    ),
    // colorScheme: ColorScheme.fromSwatch().copyWith(secondary: kDarkAccent),
  );
}