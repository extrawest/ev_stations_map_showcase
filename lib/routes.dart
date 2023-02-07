import 'package:flutter/material.dart';
import 'package:volkhov_maps_app/screens/map_sreen.dart';

import 'flavor_banner.dart';
import 'screens/home_screen.dart';
import 'screens/splash_screen.dart';

const String homeScreenRoute = '/home_screen';
const String splashScreenRoute = '/splash_screen';
const String mapScreenRoute = '/map_screen';

Map<String, WidgetBuilder> applicationRoutes = <String, WidgetBuilder>{
  splashScreenRoute: (context) => SplashScreen(),
  homeScreenRoute: (context) => const FlavorBanner(child: HomeScreen()),
  mapScreenRoute: (context) => const MapScreen(),
  mapMainRoute: (context) => const MapMainScreen(),
};
