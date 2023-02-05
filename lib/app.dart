// import 'dart:html' as html;
// import 'dart:js' as js;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:volkhov_maps_app/routes.dart';
import 'package:volkhov_maps_app/theme/theme.dart';
import 'package:volkhov_maps_app/view_models/theme_view_model.dart';

// import '' if (kIsWeb) 'dart:html' as html;
import 'services/api_service.dart';
import 'services/credentials_loader.dart';
import 'view_models/home_view_model.dart';
import 'view_models/posts_view_model.dart';

class Application extends StatelessWidget {
  final Credentials credentials;

  const Application(this.credentials, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //   if (kIsWeb) {
    //     //To expone the dart variable to global js code
    //     js.context['web_key'] = const String.fromEnvironment('DEFINE_WEB_KEY');
    //     //Custom DOM event to signal to js the execution of the dart code
    //     html.document.dispatchEvent(html.CustomEvent('dart_loaded'));
    //   }

    return MultiBlocProvider(
      providers: [],
      child: MultiProvider(
          providers: [
            // ChangeNotifierProvider(create: (context) => HomeViewModel()),
            ChangeNotifierProvider(
              create: (context) =>
                  PostsViewModel(ApiService(credentials.apiDomain)),
            ),
            Provider.value(value: credentials),
          ],
          child: MaterialApp(
            title: 'Flutter Provider Starter',
            theme: lightTheme,
            darkTheme: darkTheme,
            initialRoute: splashScreenRoute,
            localizationsDelegates: context.localizationDelegates,
            supportedLocales: context.supportedLocales,
            locale: context.locale,
            routes: applicationRoutes,
          )),
    );
  }
}
