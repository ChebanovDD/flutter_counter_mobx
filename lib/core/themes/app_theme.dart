import 'package:flutter/material.dart';

class AppTheme {
  const AppTheme._();

  static Color lightAccentColor = Colors.blueGrey.shade200;
  static Color lightPrimaryColor = const Color(0xfff2f2f2);
  static Color lightParticlesColor = const Color(0x44948282);
  static Color lightBackgroundColor = const Color(0xfff2f2f2);

  static Color darkAccentColor = Colors.blueGrey.shade600;
  static Color darkPrimaryColor = const Color(0xff1a2127);
  static Color darkParticlesColor = const Color(0x441c2a3d);
  static Color darkBackgroundColor = const Color(0xff1a2127);

  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    accentColor: lightAccentColor,
    primaryColor: lightPrimaryColor,
    backgroundColor: lightBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );

  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    accentColor: darkAccentColor,
    primaryColor: darkPrimaryColor,
    backgroundColor: darkBackgroundColor,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}