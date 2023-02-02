import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color redLight = Color(0xFFE44125);
const Color blackShade = Color(0xFF222222);
const Color cherryRed = Color(0xffe8001d);
const Color greyShadeLight = Color(0xFFE5E5E5);
const Color greyLight = Color(0x0c000000);
const Color white = Color(0xffffffff);


class TextStyles {
  static const notifierTextLabel = TextStyle(
    fontSize: 26,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w300,
  );
}

ThemeData darkTheme = ThemeData(
  primaryColor: Colors.black,
  backgroundColor: blackShade,
  colorScheme: ColorScheme.dark(primary: Colors.grey.shade200),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(foregroundColor: Colors.black),
  dividerColor: Colors.black12,
  // or use string of the font in the assets 'SFUIDisplay'
  fontFamily: GoogleFonts.roboto().fontFamily,
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 22.0, fontStyle: FontStyle.italic),
    bodyText2: TextStyle(fontSize: 14.0),
  ),
);

ThemeData lightTheme = ThemeData(
  primaryColor: Colors.white,
  backgroundColor: greyShadeLight,
  colorScheme: const ColorScheme.light(primary: Colors.black54),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(foregroundColor: Colors.white),
  dividerColor: Colors.white54,
  // or use string of the font in the assets 'SFUIDisplay'
  fontFamily: GoogleFonts.roboto().fontFamily,
  textTheme: const TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    headline6: TextStyle(fontSize: 22.0, fontStyle: FontStyle.italic),
    bodyText2: TextStyle(fontSize: 14.0),
  ),
);
