import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:volkhov_maps_app/logic/bloc/jump_to_marker/jump_to_marker_bloc.dart';
import 'package:volkhov_maps_app/routes.dart';
import 'package:volkhov_maps_app/theme/theme.dart';

import 'logic/bloc/bloc.dart';
import 'repository/repositories.dart';
import 'services/api_service.dart';
import 'services/credentials_loader.dart';

class Application extends StatelessWidget {
  final Credentials credentials;

  const Application(
    this.credentials, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => ChargestationsBloc(
            apiService: ApiService(credentials.apiDomain),
          )..add(ChargestationsStarted()),
        ),
        BlocProvider(
          create: (_) => WalletBloc(
            apiService: ApiService(credentials.apiDomain),
          )..add(WalletStarted()),
        ),
        BlocProvider(
          create: (_) => SearchStationBloc(),
        ),
        BlocProvider(
          create: (_) =>
              FavoritesBloc(storageRepository: StorageRepositoryImpl()),
        ),
        BlocProvider(
          create: (_) => AuthBloc(authRepository: AuthGoogleImplement()),
        ),
        BlocProvider(
          create: (_) => JumpToMarkerBloc(),
        ),
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
      ),
    );
  }
}
