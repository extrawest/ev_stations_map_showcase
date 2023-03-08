import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/bloc/bloc.dart';
import '../theme/themes.dart';
import '../widgets/widgets.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = context.watch<AuthBloc>();
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search station'),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          foregroundColor: AppColors.blackColor,
          shadowColor: Colors.transparent,
        ),
        body: BlocListener<AuthBloc, AuthState>(
          listener: (context, listenState) {
            if (listenState is AuthError) {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(
                  SnackBar(
                    content: Text('Error: ${listenState.error}'),
                  ),
                );
            } else if (listenState is AuthAutorized) {
              Navigator.of(context).pop();
            }
          },
          child: Scaffold(
            backgroundColor: AppColors.whiteColor,
            body: SignUpWidget(
              onTap: () async {
                if (authBloc.state is AuthUnautorized) {
                  authBloc.add(AuthSignIn());
                }
                if (authBloc.state is AuthAutorized) {
                  context.read<FavoritesBloc>().add(FavoritesRead());
                  Navigator.of(context).pop();
                }
              },
            ),
          ),
        ));
  }
}
