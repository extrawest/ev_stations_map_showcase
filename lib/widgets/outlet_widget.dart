import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/themes.dart';

class OutletWidget extends StatelessWidget {
  final bool enabled;
  final String price;
  final String type;
  final String power;
  const OutletWidget({
    super.key,
    required this.enabled,
    required this.price,
    required this.type,
    required this.power,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.lightGrey,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(greenPlug),
              const SizedBox(width: 7),
              Text(
                price,
                style: TextStyles.textStyle.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            type,
            style: TextStyles.textStyle.copyWith(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: AppColors.blackColor,
            ),
          ),
          Text(
            power,
            style: TextStyles.textStyle.copyWith(
              fontSize: 10,
              fontWeight: FontWeight.w400,
              color: AppColors.greyTextColor,
            ),
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5),
            width: 76,
            decoration: BoxDecoration(
                color: enabled ? AppColors.lightGreen : AppColors.lightGrey,
                borderRadius: BorderRadius.circular(4)),
            child: Text(enabled ? 'Charge' : 'In Use',
                textAlign: TextAlign.center,
                style: TextStyles.textStyle.copyWith(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: enabled
                        ? AppColors.whiteColor
                        : AppColors.greyTextColor)),
          )
        ],
      ),
    );
  }
}
