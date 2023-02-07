import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:volkhov_maps_app/theme/app_colors.dart';
import 'package:volkhov_maps_app/theme/assets.dart';

class SquareButton extends StatelessWidget {
  final String asset;
  const SquareButton({super.key, required this.asset});

  @override
  Widget build(BuildContext context) {
    return Container(
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
