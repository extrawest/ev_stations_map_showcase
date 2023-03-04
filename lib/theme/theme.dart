import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'themes.dart';

const Color redLight = Color(0xFFE44125);
const Color blackShade = Color(0xFF222222);
const Color cherryRed = Color(0xffe8001d);
const Color greyShadeLight = Color(0xFFE5E5E5);
const Color greyLight = Color(0x0c000000);
const Color white = Color(0xffffffff);

class TextStyles {
  static const notifierTextLabel = TextStyle(
    fontSize: 26,
    fontFamily: 'Inter',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w300,
  );

  static const headerTextStyle = TextStyle(
    fontSize: 20,
    fontFamily: 'Inter',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w700,
    color: AppColors.blackColor,
  );

  static const appBarTextStyle = TextStyle(
    fontSize: 18,
    fontFamily: 'Inter',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: AppColors.blackColor,
  );

  static const textStyle = TextStyle(
    fontSize: 16,
    fontFamily: 'Inter',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: AppColors.blackColor,
  );

  static const textWalletStyle = TextStyle(
    fontSize: 14,
    fontFamily: 'Inter',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: AppColors.blackColor,
  );

  static const smallTextStyle = TextStyle(
    fontSize: 12,
    fontFamily: 'Inter',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.w400,
    color: AppColors.blackColor,
  );
}

ThemeData darkTheme = ThemeData(
  primaryColor: Colors.black,
  colorScheme:
      ColorScheme.dark(primary: Colors.grey.shade200, background: blackShade),
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(foregroundColor: Colors.black),
  dividerColor: Colors.black12,
  // or use string of the font in the assets 'SFUIDisplay'
  fontFamily: GoogleFonts.roboto().fontFamily,
  textTheme: const TextTheme(
      displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      titleLarge: TextStyle(fontSize: 22.0, fontStyle: FontStyle.italic),
      bodyMedium: TextStyle(fontSize: 14.0)),
);

ThemeData lightTheme = ThemeData(
  primaryColor: Colors.white,
  colorScheme: const ColorScheme.light(
      primary: Colors.black54, background: greyShadeLight),
  floatingActionButtonTheme:
      const FloatingActionButtonThemeData(foregroundColor: Colors.white),
  dividerColor: Colors.white54,
  // or use string of the font in the assets 'SFUIDisplay'
  fontFamily: GoogleFonts.roboto().fontFamily,
  textTheme: const TextTheme(
    displayLarge: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
    titleLarge: TextStyle(fontSize: 22.0, fontStyle: FontStyle.italic),
    bodyMedium: TextStyle(fontSize: 14.0),
  ),
);
