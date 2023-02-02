import 'dart:async';
import 'dart:convert';

import 'package:flutter/services.dart';

import '../utils/application_utils.dart';
import '../utils/logger.dart';

class CredentialsLoader {
  final String pathToFile;

  CredentialsLoader({required this.pathToFile});

  Future<Credentials> load() async {
    final applicationVersion = await getApplicationVersion();
    log.fine('applicationVersion $applicationVersion');
    return rootBundle.loadStructuredData<Credentials>(pathToFile, (jsonStr) async {
      final secret = Credentials.fromJson(json.decode(jsonStr), applicationVersion);
      log.fine('secret $secret');
      return secret;
    });
  }
}

class Credentials {
  final String appName;
  final String flavorName;
  final String apiDomain;
  final String applicationVersion;

  Credentials({
    required this.appName,
    required this.flavorName,
    required this.apiDomain,
    required this.applicationVersion,
  });

  factory Credentials.fromJson(Map<String, dynamic> json, String applicationVersion) => Credentials(
        appName: json['appName'],
        flavorName: json['flavorName'],
        apiDomain: json['apiDomain'],
        applicationVersion: applicationVersion,
      );

  // applicationVersion is not included. Add it if needed
  Map<String, dynamic> toJson() => {
        'appName': appName,
        'flavorName': flavorName,
        'apiDomain': apiDomain,
      };

  @override
  String toString() {
    return 'Credentials{appName: $appName, flavorName: $flavorName, apiDomain: $apiDomain, applicationVersion: $applicationVersion}';
  }
}
