import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
  bool loading = false;
  bool signedUp = false;
  User? firebaseUser;

  @override
  Widget build(BuildContext context) {
    // (kIsWeb) ? signInWithGoogleWeb() : signInWithGoogle();
    signedUp = GoogleAuth.firebaseUser != null;
    return loading
        ? const Center(child: CircularProgressIndicator())
        : Scaffold(
            body: signedUp
                ? ProfileWidget(
                    onLogOut: () async {
                      setState(() {
                        loading = true;
                      });
                      await GoogleAuth.signOutGoogle(context);
                      if (GoogleAuth.firebaseUser == null) {
                        signedUp = false;
                      }
                      setState(() {
                        loading = false;
                      });
                    },
                  )
                : SignUpWidget(
                    onTap: () async {
                      setState(() {
                        loading = true;
                      });
                      await GoogleAuth.signInWithGoogle(context);
                      if (GoogleAuth.firebaseUser != null) {
                        signedUp = true;
                      }
                      setState(() {
                        loading = false;
                      });
                    },
                  ),
          );
  }
}
