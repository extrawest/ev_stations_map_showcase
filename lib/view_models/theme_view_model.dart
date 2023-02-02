import 'package:flutter/material.dart';
import 'package:volkhov_maps_app/database/home_dao.dart';
import 'package:volkhov_maps_app/models/item_model.dart';
import 'package:volkhov_maps_app/theme/theme.dart';

import '../generated/locale_keys.g.dart';

enum BrightnessThemeMode { light, dark, auto }

class ThemeViewModel extends ChangeNotifier {
  final HomeDao homeDao = HomeDao();
  bool isLightTheme = true;
  ThemeData? currentDarkTheme;
  late BrightnessThemeMode currentThemeType;

  Future<void> init() async {
    final theme = await homeDao.getBrightnessSavedSettings();
    if (theme == null || theme == 'auto') {
      theme ??
          await homeDao
              .save(Item(key: homeDao.appColorThemeKey, value: 'auto'));
      currentThemeType = BrightnessThemeMode.auto;
      currentDarkTheme = darkTheme;
    } else {
      if (theme == 'light') {
        currentThemeType = BrightnessThemeMode.light;
      } else {
        currentThemeType = BrightnessThemeMode.dark;
        currentDarkTheme = darkTheme;
        isLightTheme = false;
      }
    }
  }

  ThemeData get getThemeData => isLightTheme ? lightTheme : darkTheme;

  void switchTheme() {
    switch (currentThemeType) {
      case BrightnessThemeMode.light:
        homeDao.save(Item(key: homeDao.appColorThemeKey, value: 'dark'));
        currentThemeType = BrightnessThemeMode.dark;
        currentDarkTheme = darkTheme;
        isLightTheme = false;
        notifyListeners();
        break;
      case BrightnessThemeMode.dark:
        homeDao.save(Item(key: homeDao.appColorThemeKey, value: 'auto'));
        currentThemeType = BrightnessThemeMode.auto;
        currentDarkTheme = darkTheme;
        isLightTheme = true;
        notifyListeners();
        break;
      case BrightnessThemeMode.auto:
        homeDao.save(Item(key: homeDao.appColorThemeKey, value: 'light'));
        currentThemeType = BrightnessThemeMode.light;
        currentDarkTheme = null;
        isLightTheme = true;
        notifyListeners();
        break;
    }
  }

  String get themeLabel {
    switch (currentThemeType) {
      case BrightnessThemeMode.light:
        return LocaleKeys.light;
      case BrightnessThemeMode.dark:
        return LocaleKeys.dark;
      case BrightnessThemeMode.auto:
        return LocaleKeys.auto;
    }
  }
}
