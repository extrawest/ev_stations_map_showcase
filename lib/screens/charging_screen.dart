
import 'package:flutter/material.dart';
import 'package:volkhov_maps_app/theme/app_colors.dart';

import '../theme/theme.dart';
import '../widgets/widgets.dart';

class ChargingScreen extends StatelessWidget {
  const ChargingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Charging session',
          style: TextStyles.appBarTextStyle,
        ),
        backgroundColor: AppColors.whiteColor,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          iconSize: 28,
          color: AppColors.blackColor,
          onPressed: () => Navigator.pop(context),
        ),
        shadowColor: Colors.transparent,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: AppColors.whiteColor,
        child: Container(
          margin: const EdgeInsets.all(13),
          padding: const EdgeInsets.only(
            top: 29,
            bottom: 24,
            left: 16,
            right: 16,
          ),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadowColor.withOpacity(0.15),
                blurRadius: 15,
                spreadRadius: 0,
                offset: const Offset(2, 6),
              ),
              BoxShadow(
                color: AppColors.shadowColor.withOpacity(0.15),
                blurRadius: 15,
                spreadRadius: 0,
                offset: const Offset(-2, -2),
              ),
            ],
          ),
          child: Column(
            children: [
              const ChargedState(),
              const CostWidget(),
              CustomButton(
                onTap: () {},
                caption: 'Stop charging',
                fontFamily: 'Poppins',
              ),
              const ChargingInfoWidget(),
              StationInfoWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

