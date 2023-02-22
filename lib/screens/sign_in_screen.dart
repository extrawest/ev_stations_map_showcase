import 'package:flutter/material.dart';

import '../theme/themes.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search station'),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          foregroundColor: AppColors.blackColor,
          shadowColor: Colors.transparent,
        ),
        body: SignUpWidget(
          onTap: () async {
            setState(() {
              loading = true;
            });
            await GoogleAuth.signInWithGoogle(context);
            if (GoogleAuth.firebaseUser != null) {
              Navigator.of(context).pop();
            }
            setState(() {
              loading = false;
            });
          },
        ));
  }
}
