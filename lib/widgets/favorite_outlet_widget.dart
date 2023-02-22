import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/themes.dart';

class FavoriteOutletWidget extends StatelessWidget {
  final String price;
  final String power;

  const FavoriteOutletWidget({
    super.key,
    required this.price,
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
              SizedBox(
                width: 28,
                height: 28,
                child: SvgPicture.asset(greenPlug),
              ),
              const SizedBox(width: 8),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    price,
                    style: TextStyles.smallTextStyle.copyWith(
                        fontWeight: FontWeight.w300,
                        color: AppColors.greyTextColor,
                        fontFamily: 'Roboto'),
                  ),
                  Text(
                    power,
                    style: TextStyles.smallTextStyle.copyWith(
                        fontWeight: FontWeight.w300,
                        color: AppColors.greyTextColor,
                        fontFamily: 'Roboto'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
