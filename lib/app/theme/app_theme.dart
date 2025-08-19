import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/AppFont.dart';

abstract class AppColor {
  static const whiteColor = Colors.white;
  static const blackColor = Colors.black;
  static const Color boxShadowColor = Color(0x02c43931);

  static Color bgAccentColor = const Color.fromRGBO(194, 241, 211, 1.0);
  static Color backGroundColor = const Color(0xFFf0f4f5);
  static Color primaryLightColor = const Color(0xFFE7EEFF);

  static const MaterialColor primaryColor = MaterialColor(0xFF173B45, <int, Color>{
    50: Color.fromRGBO(23, 59, 69, .1),
    100: Color.fromRGBO(23, 59, 69, .2),
    200: Color.fromRGBO(23, 59, 69, .3),
    300: Color.fromRGBO(23, 59, 69, .4),
    400: Color.fromRGBO(23, 59, 69, .5),
    500: Color.fromRGBO(23, 59, 69, .6),
    600: Color.fromRGBO(23, 59, 69, .7),
    700: Color.fromRGBO(23, 59, 69, .8),
    800: Color.fromRGBO(23, 59, 69, .9),
    900: Color.fromRGBO(23, 59, 69, 1),
  });

  static const MaterialColor secondaryColor = MaterialColor(0xFFFF8225, <int, Color>{
    50: Color.fromRGBO(255, 130, 37, .1),
    100: Color.fromRGBO(255, 130, 37, .2),
    200: Color.fromRGBO(255, 130, 37, .3),
    300: Color.fromRGBO(255, 130, 37, .4),
    400: Color.fromRGBO(255, 130, 37, .5),
    500: Color.fromRGBO(255, 130, 37, .6),
    600: Color.fromRGBO(255, 130, 37, .7),
    700: Color.fromRGBO(255, 130, 37, .8),
    800: Color.fromRGBO(255, 130, 37, .9),
    900: Color.fromRGBO(255, 130, 37, 1),
  });

  static const MaterialColor upiBlueColor = MaterialColor(0xFF1E3A81, <int, Color>{
    50: Color.fromRGBO(30, 58, 129, .1),
    100: Color.fromRGBO(30, 58, 129, .2),
    200: Color.fromRGBO(30, 58, 129, .3),
    300: Color.fromRGBO(30, 58, 129, .4),
    400: Color.fromRGBO(30, 58, 129, .5),
    500: Color.fromRGBO(30, 58, 129, .6),
    600: Color.fromRGBO(30, 58, 129, .7),
    700: Color.fromRGBO(30, 58, 129, .8),
    800: Color.fromRGBO(30, 58, 129, .9),
    900: Color.fromRGBO(30, 58, 129, 1),
  });

  static const kContainerShadow = [
    BoxShadow(
      offset: Offset(2.0, 2.0),
      blurRadius: 12.0,
      color: Color.fromRGBO(0, 0, 0, 0.16),
    )
  ];

  static ThemeData pickTimeTheme() {
    final ThemeData base = ThemeData.light();
    return base.copyWith(
      textTheme: GoogleFonts.poppinsTextTheme(
        ThemeData.light().textTheme,
      ),
      colorScheme: ColorScheme(
        primary: AppColor.primaryColor.shade400,
        secondary: AppColor.primaryColor.shade50,
        surface: whiteColor,
        error: Colors.red,
        onPrimary: AppColor.whiteColor,
        onSecondary: AppColor.blackColor,
        onSurface: AppColor.blackColor,
        onError: AppColor.whiteColor,
        brightness: Brightness.light,
      ),
      cardColor: Colors.white,
      canvasColor: Colors.white,
      primaryColor: AppColor.primaryColor.shade100,
      scaffoldBackgroundColor: Colors.white,
      textButtonTheme: TextButtonThemeData(
        style: ButtonStyle(
          foregroundColor: WidgetStateProperty.resolveWith<Color>((states) {
            if (states.contains(WidgetState.pressed) || states.contains(WidgetState.disabled)) {
              return primaryColor;
            }
            return primaryColor.shade500;
          }),
          textStyle: WidgetStateProperty.all(
            const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: font18,
            ),
          ),
        ),
      ),
      dialogTheme: DialogTheme(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  static BoxDecoration boxDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: const BorderRadius.all(Radius.circular(10.0)),
    boxShadow: [
      BoxShadow(
        color: Colors.grey.shade300,
        spreadRadius: 0.1,
        blurRadius: 6.0,
      )
    ],
  );
}
