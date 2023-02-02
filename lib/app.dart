import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:volkhov_maps_app/routes.dart';
import 'package:volkhov_maps_app/view_models/theme_view_model.dart';

import 'services/api_service.dart';
import 'services/credentials_loader.dart';
import 'view_models/home_view_model.dart';
import 'view_models/posts_view_model.dart';

class Application extends StatelessWidget {
  final Credentials credentials;

  const Application(this.credentials, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeViewModel()),
        ChangeNotifierProvider(
          create: (context) =>
              PostsViewModel(ApiService(credentials.apiDomain)),
        ),
        Provider.value(value: credentials),
      ],
      child: Consumer<ThemeViewModel>(builder: (context, themeViewModel, _) {
        return MaterialApp(
          title: 'Flutter Provider Starter',
          theme: themeViewModel.getThemeData,
          darkTheme: themeViewModel.currentDarkTheme,
          initialRoute: splashScreenRoute,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          routes: applicationRoutes,
        );
      }),
    );
  }
}
