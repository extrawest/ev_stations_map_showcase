import 'package:flutter/material.dart';

import '../theme/themes.dart';

class SquareButton extends StatelessWidget {
  final String asset;
  const SquareButton({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 4,
        ),
        padding: const EdgeInsets.all(10),
        width: 48,
        height: 48,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.lightBlue),
        ),
        child: Image.asset(
          asset,
        ));
  }
}
