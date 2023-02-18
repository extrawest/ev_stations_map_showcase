import 'package:flutter/material.dart';

import '../theme/themes.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: AppColors.blackColor,
        shadowColor: Colors.transparent,
      ),
      body: Stack(),
    );
  }
}
