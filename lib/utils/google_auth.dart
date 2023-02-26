import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'logger.dart';

class GoogleAuth {
  Future<User?> signInWithGoogle(BuildContext context) async {
    final firebaseAuth = FirebaseAuth.instance;

    User? firebaseUser;
    GoogleSignInAccount? googleUser;

    try {
      final isSignedIn = await GoogleSignIn().isSignedIn();

      if (isSignedIn) {
        // if so, return the current user
        firebaseUser =
            FirebaseAuth.instanceFor(app: await Firebase.initializeApp())
                .currentUser;
      } else {
        if (kIsWeb) {
          final GoogleAuthProvider authProvider = GoogleAuthProvider();

          try {
            final UserCredential userCredential =
                await firebaseAuth.signInWithPopup(authProvider);

            firebaseUser = userCredential.user;
          } catch (e) {
            log.fine(e);
          }
        } else {
          googleUser = await GoogleSignIn().signIn();
          final GoogleSignInAuthentication? googleAuth =
              await googleUser?.authentication;

          final credential = GoogleAuthProvider.credential(
            accessToken: googleAuth?.accessToken,
            idToken: googleAuth?.idToken,
          );

          firebaseUser = (await FirebaseAuth.instanceFor(
                      app: await Firebase.initializeApp())
                  .signInWithCredential(credential))
              .user;
        }
      }
      return firebaseUser;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
          ),
        );
    }
    return null;
  }

  Future<bool> signOutGoogle(BuildContext context) async {
    bool isSignedOut;
    try {
      // ignore: unused_local_variable
      final googleUser = await GoogleSignIn().signOut();

      isSignedOut = true;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
          ),
        );
      isSignedOut = false;
    }
    return isSignedOut;
  }
}
