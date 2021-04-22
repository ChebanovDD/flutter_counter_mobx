import 'package:flutter/material.dart';
import 'package:flutter_counter_mobx/core/themes/app_theme.dart';
import 'package:mobx/mobx.dart';

part 'theme_store.g.dart';

class ThemeStore = _ThemeStore with _$ThemeStore;

abstract class _ThemeStore with Store {
  _ThemeStore() {
    updateAppTheme();
  }

  @observable
  ThemeMode themeMode;

  @action
  void updateAppTheme() {
    AppTheme.currentSystemBrightness == Brightness.light
        ? _setTheme(ThemeMode.light)
        : _setTheme(ThemeMode.dark);
  }

  void _setTheme(ThemeMode themeMode) {
    this.themeMode = themeMode;
    AppTheme.setStatusBarAndNavigationBarColors(themeMode);
  }
}