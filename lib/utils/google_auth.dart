import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class GoogleAuth {
  static User? firebaseUser;
  static final firebaseAuth = FirebaseAuth.instance;
  final temp = '';
  static GoogleSignInAccount? googleUser;

  static Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final isSignedIn = await GoogleSignIn().isSignedIn();

      if (isSignedIn) {
        // if so, return the current user
        firebaseUser =
            FirebaseAuth.instanceFor(app: await Firebase.initializeApp())
                .currentUser;
      } else {
        googleUser = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        final UserCredential userCredential =
            await firebaseAuth.signInWithCredential(credential);

        // firebaseUser =
        //     (await FirebaseAuth.instanceFor(app: await Firebase.initializeApp())
        //             .signInWithCredential(credential))
        //         .user;
        firebaseUser = firebaseAuth.currentUser;
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
          ),
        );
    }
  }

  static Future<void> signOutGoogle(BuildContext context) async {
    try {
      googleUser = await GoogleSignIn().signOut();
      firebaseUser = null;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(
          SnackBar(
            content: Text('Error: $e'),
          ),
        );
    }
  }
}
