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
        body: SignUpWidget(
          onTap: () async {
            if (authBloc.state is AuthUnautorized) {
              authBloc.add(AuthSignIn(context: context));
            }
            if (authBloc.state is AuthAutorized) {
              context.read<FavoritesBloc>().add(FavoritesRead());
              Navigator.of(context).pop();
            }
          },
        ));
  }
}
