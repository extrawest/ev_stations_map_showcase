import 'package:flutter/material.dart';

import '../theme/themes.dart';

class ChargingInfoWidget extends StatelessWidget {
  const ChargingInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 38,
        bottom: 24,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Starting time',
                style: TextStyles.textWalletStyle
                    .copyWith(color: AppColors.greyTextColor),
              ),
              Text(
                '21/07/21 17:46',
                style: TextStyles.textWalletStyle.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.greyTextColor,
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Charging speed',
                style: TextStyles.textWalletStyle
                    .copyWith(color: AppColors.greyTextColor),
              ),
              Text(
                '50 kWh',
                style: TextStyles.textWalletStyle.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppColors.greyTextColor,
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Amperage',
                style: TextStyles.textWalletStyle.copyWith(
                  color: AppColors.greyTextColor,
                ),
              ),
              Text('16 A ',
                  style: TextStyles.textWalletStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.greyTextColor,
                  ))
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Voltage',
                style: TextStyles.textWalletStyle.copyWith(
                  color: AppColors.greyTextColor,
                ),
              ),
              Text('150 A ',
                  style: TextStyles.textWalletStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.greyTextColor,
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
