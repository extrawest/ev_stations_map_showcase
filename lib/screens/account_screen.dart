import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/bloc/bloc.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({
    super.key,
  });

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool isLoading = false;
  bool isSignedUp = false;
  User? firebaseUser;

  @override
  Widget build(BuildContext context) {
    isSignedUp = GoogleAuth.firebaseUser != null;
    final favoriteBloc = context.watch<FavoritesBloc>();

    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            body: isSignedUp
                ? ProfileWidget(
                    onLogOut: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await GoogleAuth.signOutGoogle(context);
                      if (GoogleAuth.firebaseUser == null) {
                        favoriteBloc.add(FavoritesClear());
                        isSignedUp = false;
                      }
                      setState(() {
                        isLoading = false;
                      });
                    },
                  )
                : SignUpWidget(
                    onTap: () async {
                      setState(() {
                        isLoading = true;
                      });
                      await GoogleAuth.signInWithGoogle(context);
                      if (GoogleAuth.firebaseUser != null) {
                        isSignedUp = true;
                      }
                      setState(() {
                        isLoading = false;
                      });
                    },
                  ),
          );
  }
}
