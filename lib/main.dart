import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:volkhov_maps_app/app.dart';
import 'package:volkhov_maps_app/theme/assets.dart';
import 'package:volkhov_maps_app/view_models/theme_view_model.dart';

import 'utils/application_utils.dart';
import 'utils/logger.dart';

// class EnvironmentConfig {
//   static const ANDROID_KEY = String.fromEnvironment('DEFINE_ANDROID_KEY');
//   static const IOS_KEY = String.fromEnvironment('DEFINE_IOS_KEY');
//   static const WEB_KEY = String.fromEnvironment('DEFINE_WEB_KEY');
// }

const isProductionEnvKey = 'IS_PRODUCTION';
const englishLocale = Locale('en', 'US');
const ukrainianLocale = Locale('uk', 'UA');

bool isProduction = false;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  isProduction =
      const bool.fromEnvironment(isProductionEnvKey, defaultValue: false);

  if (isProduction) {
    EasyLocalization.logger.enableBuildModes = [];
  }

  final themeViewModel = ThemeViewModel();
  await themeViewModel.init();

  setupLogger();

  final credentials = await loadCredentials();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);

  final app = EasyLocalization(
    supportedLocales: const [englishLocale, ukrainianLocale],
    path: translationsFolderPath,
    fallbackLocale: englishLocale,
    child: ChangeNotifierProvider.value(
      value: themeViewModel,
      child: Application(credentials),
    ),
  );

  runApp(app);
}
