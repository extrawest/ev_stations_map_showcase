import 'dart:math';

import 'package:flutter/material.dart';

import '../theme/themes.dart';

class ChargedState extends StatelessWidget {
  const ChargedState({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 195.75,
      height: 204.08,
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Transform.rotate(
            angle: pi / 2,
            child: Container(
              width: 195.75,
              height: 195.75,
              decoration: BoxDecoration(
                gradient: const SweepGradient(
                  center: FractionalOffset.center,
                  colors: <Color>[
                    AppColors.gradientStartColor,
                    AppColors.gradientFinishColor,
                  ],
                  stops: <double>[0.0, 1.0],
                ),
                borderRadius: BorderRadius.circular(195.75),
              ),
            ),
          ),
          Positioned(
            top: 2,
            child: Container(
              width: 191.75,
              height: 191.75,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(191.75),
                  color: AppColors.whiteColor),
            ),
          ),
          Positioned(
            top: 7.875,
            child: Container(
              width: 180,
              height: 180,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(180),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.shadowColor.withOpacity(0.1),
                      blurRadius: 7,
                      spreadRadius: 2,
                      offset: const Offset(2, 2),
                    ),
                    BoxShadow(
                      color: AppColors.shadowColor.withOpacity(0.1),
                      blurRadius: 7,
                      spreadRadius: 2,
                      offset: const Offset(-2, -2),
                    ),
                  ],
                  color: AppColors.whiteColor),
              child: Container(
                margin: const EdgeInsets.all(5),
                width: 170,
                height: 170,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(170),
                  border: Border.all(
                    color: AppColors.lightBlue,
                    width: 0.5,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 15),
                    SizedBox(
                      height: 16,
                      child: Image.asset(
                        flashIconPng,
                        color: AppColors.activeBottomBarButton,
                      ),
                    ),
                    Text(
                      '24%',
                      style: TextStyles.textStyle.copyWith(
                          color: AppColors.activeBottomBarButton,
                          fontFamily: 'Inter'),
                    ),
                    const SizedBox(height: 20),
                    Text('6.07 kWh',
                        style: TextStyles.headerTextStyle
                            .copyWith(fontFamily: 'Inter')),
                    Text(
                      'Delivered',
                      style: TextStyles.smallTextStyle.copyWith(
                          color: AppColors.greyTextColor, fontFamily: 'Inter'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 191.585,
            child: Container(
              width: 8.33,
              height: 8.33,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.activeBottomBarButton,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
