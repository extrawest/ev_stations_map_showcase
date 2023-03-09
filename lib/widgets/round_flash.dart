import 'package:flutter/material.dart';

import '../theme/themes.dart';

class RoundFlash extends StatelessWidget {
  final Color color;
  const RoundFlash({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.whiteColor, width: 1.25),
      ),
      child: Container(
        width: 45,
        height: 45,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(color: color, width: 4)),
        child: Image.asset(
          flashIconPng,
          color: color,
        ),
      ),
    );
  }
}
