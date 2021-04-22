import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';

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

  static Brightness get currentSystemBrightness =>
      SchedulerBinding.instance.window.platformBrightness;

  static void setStatusBarAndNavigationBarColors(ThemeMode themeMode) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: themeMode == ThemeMode.light ? Brightness.dark : Brightness.light,
        systemNavigationBarDividerColor: Colors.transparent,
        systemNavigationBarColor: themeMode == ThemeMode.light ? lightBackgroundColor : darkBackgroundColor,
        systemNavigationBarIconBrightness: themeMode == ThemeMode.light ? Brightness.dark : Brightness.light
    ));
  }
}

extension ThemeExtras on ThemeData {
  Color get particlesColor => brightness == Brightness.light
      ? AppTheme.lightParticlesColor
      : AppTheme.darkParticlesColor;
}