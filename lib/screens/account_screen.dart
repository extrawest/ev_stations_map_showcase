import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/bloc/bloc.dart';
import '../widgets/widgets.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final authBloc = context.watch<AuthBloc>();

    final favoriteBloc = context.read<FavoritesBloc>();

    return BlocListener<AuthBloc, AuthState>(
      listener: (context, listenState) {
        if (listenState is AuthError) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text('Error: ${listenState.error}'),
              ),
            );
        }
      },
      child: Scaffold(
        body: (authBloc.state is AuthAutorized)
            ? ProfileWidget(
                onLogOut: () async {
                  favoriteBloc.add(FavoritesClear());
                  authBloc.add(AuthSignOut());
                },
              )
            : SignUpWidget(
                onTap: () async {
                  authBloc.add(AuthSignIn());
                },
              ),
      ),
    );
  }
}
