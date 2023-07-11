import 'package:flutter/material.dart';
import 'package:shopping/utils/constant.dart';

class MyTheme {
  static final lightTheme = ThemeData(
      primaryColor: primaryColor,
      primarySwatch: Palette.kToDark,
      fontFamily: 'SecularOne-Regular',
      scaffoldBackgroundColor: Colors.white,
      appBarTheme: const AppBarTheme(backgroundColor: primaryColor),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              backgroundColor: primaryColor,
              padding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 8))),
      scrollbarTheme: ScrollbarThemeData(
        thickness: MaterialStateProperty.all(5),
        thumbColor: MaterialStateProperty.all(Colors.transparent),
        radius: const Radius.circular(10),
      ));
}

class Palette {
  static const MaterialColor kToDark = MaterialColor(
    0xFF0D47A1, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    <int, Color>{
      50: Color(0xFFE3F2FD),
      100: Color(0xFFBBDEFB),
      200: Color(0xFF90CAF9),
      300: Color(0xFF64B5F6),
      400: Color(0xFF42A5F5),
      500: Color(0xFF070961),
      600: Color(0xFF1E88E5),
      700: Color(0xFF1976D2),
      800: Color(0xFF1565C0),
      900: Color(0xFF0D47A1),
    },
  );
}
