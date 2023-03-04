import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:volkhov_maps_app/app.dart';
import 'package:volkhov_maps_app/theme/assets.dart';

import 'firebase_options.dart';

import 'utils/utils.dart';

const isProductionEnvKey = 'IS_PRODUCTION';
const englishLocale = Locale('en', 'US');
const ukrainianLocale = Locale('uk', 'UA');

bool isProduction = false;

Future<void> main() async {
  PlatformSelector().createScriptElement();

  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

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

  runApp(DevicePreview(
    enabled: kIsWeb,
    builder: (context) => app,
    isToolbarVisible: false,
    data: DevicePreviewData(
      deviceIdentifier: Devices.android.onePlus8Pro.toString(),
      isFrameVisible: false,
    ),
  ));
}
