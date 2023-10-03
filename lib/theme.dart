import 'package:flutter/material.dart';

import 'constants/colors.dart';

ThemeData theme() {
  return ThemeData(
    useMaterial3: true,
    primaryColor: fPrimaryColor,
    appBarTheme: appBarTheme(),
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Muli",
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: fPrimaryColor, foregroundColor: fPrimaryLightColor),
    popupMenuTheme: const PopupMenuThemeData(
      color: fPrimaryLightColor,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    elevatedButtonTheme: elevatedButtonTheme(),
    switchTheme: SwitchThemeData(
      thumbColor: MaterialStateProperty.all(fPrimaryColor),
      trackColor: MaterialStateProperty.all(fPrimaryColor.withOpacity(0.2)),
    ),
  );
}

ElevatedButtonThemeData elevatedButtonTheme() {
  return ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      foregroundColor: fPrimaryLightColor,
      backgroundColor: fPrimaryColor,
    ),
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: const BorderSide(color: fTextColor),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    labelStyle: const TextStyle(
      color: fPrimaryColor,
    ),
    floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme textTheme() {
  return const TextTheme(
    bodyLarge: TextStyle(color: fTextColor),
    bodyMedium: TextStyle(color: fTextColor),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.white,
    elevation: 0,
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    titleTextStyle: TextStyle(
      color: Color(0xFF8B8B8B),
      fontSize: 20.0,
    ),
  );
}
