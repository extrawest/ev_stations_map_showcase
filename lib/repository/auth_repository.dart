import 'package:firebase_auth/firebase_auth.dart';

import '../utils/utils.dart';

abstract class AuthRepository {
  Future<User?> signIn();
  Future<bool> signOut();
}

class AuthGoogleImplement implements AuthRepository {
  GoogleAuth googleAuth;

  AuthGoogleImplement() : googleAuth = GoogleAuth();

  @override
  Future<User?> signIn() async {
    return await googleAuth.signInWithGoogle();
  }

  @override
  Future<bool> signOut() async {
    return await googleAuth.signOutGoogle();
  }
}
