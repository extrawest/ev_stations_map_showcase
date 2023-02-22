import 'package:flutter/material.dart';

import 'screens/screens.dart';

// import 'flavor_banner.dart';

const String homeScreenRoute = '/home_screen';
const String splashScreenRoute = '/splash_screen';
const String mapScreenRoute = '/map_screen';
const String mapMainScreenRoute = '/map_main_screen';
const String chargingScreenRoute = '/charging_screen';
const String searchScreenRoute = '/search_screen';
const String accountScreenRoute = '/account_screen';
const String favoritesScreenRoute = '/favorites_screen';
const String signInScreen = '/sign_in_screen';

Map<String, WidgetBuilder> applicationRoutes = <String, WidgetBuilder>{
  splashScreenRoute: (context) => SplashScreen(),
  homeScreenRoute: (context) => const HomeScreen(),
  mapScreenRoute: (context) => const MapScreen(),
  mapMainScreenRoute: (context) => const MapMainScreen(),
  chargingScreenRoute: (context) => const ChargingScreen(),
  searchScreenRoute: (context) => const SearchScreen(),
  accountScreenRoute: (context) => const AccountScreen(),
  favoritesScreenRoute: (context) => const FavoritesScreen(),
  signInScreen: (context) => const SignInScreen(),
};
