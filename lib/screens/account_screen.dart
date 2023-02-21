import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const signedUp = true;

    return Scaffold(
      body: signedUp ? const ProfileWidget() : const SignUpWidget(),
    );
  }
}
