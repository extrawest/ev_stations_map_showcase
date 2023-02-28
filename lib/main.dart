import 'dart:html' as html;
import 'dart:js' as js;

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volkhov_maps_app/app.dart';
import 'package:volkhov_maps_app/simple_bloc_observer.dart';
import 'package:volkhov_maps_app/theme/assets.dart';
import 'package:volkhov_maps_app/utils/html_utils.dart';

import 'firebase_options.dart';
import 'utils/application_utils.dart';
import 'utils/logger.dart';

const isProductionEnvKey = 'IS_PRODUCTION';
const englishLocale = Locale('en', 'US');
const ukrainianLocale = Locale('uk', 'UA');

bool isProduction = false;

Future<void> main() async {
  createScriptElement();

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = SimpleBlocObserver();

  isProduction =
      const bool.fromEnvironment(isProductionEnvKey, defaultValue: false);

  if (isProduction) {
    EasyLocalization.logger.enableBuildModes = [];
  }

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
    child: Application(credentials),
  );

  runApp(app);
}
