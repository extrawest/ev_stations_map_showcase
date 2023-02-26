import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../utils/utils.dart';

abstract class AuthRepository {
  Future<User?> signIn(BuildContext context);
  Future<bool> signOut(BuildContext context);
}

class AuthGoogleImplement implements AuthRepository {
  GoogleAuth googleAuth;

  AuthGoogleImplement() : googleAuth = GoogleAuth();

  @override
  Future<User?> signIn(BuildContext context) async {
    return await googleAuth.signInWithGoogle(context);
  }

  @override
  Future<bool> signOut(BuildContext context) async {
    return await googleAuth.signOutGoogle(context);
  }
}
