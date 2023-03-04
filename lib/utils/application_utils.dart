import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:volkhov_maps_app/theme/assets.dart';

import '../main.dart';
import '../services/credentials_loader.dart';
import 'logger.dart';

bool useVibration = true;

/// Use this method if you need to map a collection and track index of item
///
/// Example usage:
///     List<String> items = ['a', 'b', 'c', 'd', 'e'];
///
///     // iterate over the list of items and map every value to a new string, for example
///     List<String> mappedStrings = indexedMap(items, (index, item) {
///       return 'Item is: $item, index of this item is: $index';
///     }).toList();
///
///     log.fine(mappedStrings);
///
///     OUTPUT:
///     ['Item is: a, index of this item is: 0', 'Item is: b, index of this item is: 1', 'Item is: c, index of this item is: 2', ...]
Iterable<E> indexedMap<E, T>(
    Iterable<T> items, E Function(int index, T item) f) sync* {
  var index = 0;
  for (final item in items) {
    yield f(index, item);
    index = index + 1;
  }
}

Future<String?> getDeviceUdId() async {
  try {
    return await FlutterUdid.udid;
  } on PlatformException catch (e) {
    log.severe('getDeviceUdId PlatformException: $e');
    return null;
  }
}

void vibrate() {
  if (useVibration) {
    HapticFeedback.selectionClick();
  }
}

Future<String> getApplicationVersion() async {
  final packageInfo = await PackageInfo.fromPlatform();
  return packageInfo.version;
}

Future<Credentials> loadCredentials() async {
  try {
    const isProd =
        bool.fromEnvironment(isProductionEnvKey, defaultValue: false);
    final credentials = await CredentialsLoader(
            pathToFile: isProd ? credentialsProdFile : credentialsDevFile)
        .load();
    return credentials;
  } catch (e) {
    log.fine('loadCredentials error: $e');
    return await CredentialsLoader(pathToFile: credentialsDevFile).load();
  }
}

void openScreenWithFade(BuildContext context, Widget screen) {
  Navigator.of(context).push(PageRouteBuilder(
      pageBuilder: (context, animation, anotherAnimation) {
        return screen;
      },
      transitionDuration: const Duration(milliseconds: 600),
      transitionsBuilder: (context, animation, anotherAnimation, child) {
        return FadeTransition(
          opacity: animation,
          child: child,
        );
      }));
}
