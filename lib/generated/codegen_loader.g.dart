// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader {
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String, dynamic> uk_UA = {
    "app_bar": {"title": "Вітаємо домашньому екрані!"},
    "button": {"cancel": "Відміна"},
    "language": {"english": "Англійська", "ukrainian": "Українська"},
    "theme": {"change_theme": "Змінити тему"},
    "plural": {
      "zero": "Будь ласка, почніть натискати кнопку '+'",
      "one": "Ви натиснули кнопку один раз",
      "other": "Ви натиснули кнопку {} раз."
    },
    "fetch_posts": "Оновити пости",
    "auto": "авто",
    "light": "світла",
    "dark": "темна",
    "resolution_aware_img":
        "Приклад використання зображення, яке враховує роздільну здатність екрану"
  };
  static const Map<String, dynamic> en_US = {
    "app_bar": {"title": "Welcome to the home page"},
    "button": {"cancel": "Cancel"},
    "language": {"english": "English", "ukrainian": "Ukrainian"},
    "theme": {"change_theme": "Change theme"},
    "plural": {
      "zero": "Please start pushing the 'plus' button.",
      "one": "You have pushed the button one time.",
      "other": "You have pushed the button {} times."
    },
    "fetch_posts": "Fetch posts",
    "auto": "auto",
    "light": "light",
    "dark": "dark",
    "resolution_aware_img": "Example of resolution-aware image usage"
  };
  static const Map<String, Map<String, dynamic>> mapLocales = {
    "uk_UA": uk_UA,
    "en_US": en_US
  };
}
