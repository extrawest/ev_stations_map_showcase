import 'package:flutter/material.dart';

import '../theme/themes.dart';

class StationInfoWidget extends StatelessWidget {
  const StationInfoWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: AppColors.lightGrey,
          width: 0.4,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Station Name',
                  style: TextStyles.textStyle.copyWith(
                    fontWeight: FontWeight.w500,
                  )),
              Text('Tariff',
                  style: TextStyles.smallTextStyle
                      .copyWith(color: AppColors.greyTextColor))
            ],
          ),
          const SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('54466767',
                  style: TextStyles.textStyle.copyWith(
                      fontFamily: 'Roboto',
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                      color: AppColors.greyTextColor)),
              Text(
                '\$ 3.00 per kWh',
                style: TextStyles.smallTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: AppColors.blackColor,
                ),
              )
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Coordinates',
                    style: TextStyles.smallTextStyle.copyWith(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                      color: AppColors.greyTextColor,
                    ),
                  ),
                  Text(
                    'Longitude, latitude here',
                    style: TextStyles.smallTextStyle.copyWith(
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w300,
                      color: AppColors.greyTextColor,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.lightBlue),
                child: Row(
                  children: [
                    Image.asset(outletPng),
                    const SizedBox(width: 4),
                    Text(
                      'Type 2 ',
                      style: TextStyles.smallTextStyle.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      '(AC)',
                      style: TextStyles.smallTextStyle.copyWith(
                          fontWeight: FontWeight.w600,
                          color: AppColors.greyTextColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
