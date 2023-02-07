import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/themes.dart';

class BottomTabBar extends StatelessWidget {
  const BottomTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 55,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(earth),
              const SizedBox(height: 10),
              Text(
                'MAP',
                style: TextStyles.textStyle.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.activeBottomBarButton,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 55,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(greyStar),
              const SizedBox(height: 10),
              Text(
                'FavoriteS'.toUpperCase(),
                style: TextStyles.textStyle.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.activeBottomBarButton.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 30,
        ),
        SizedBox(
          width: 55,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(wallet),
              const SizedBox(height: 10),
              Text(
                '\$100.23'.toUpperCase(),
                style: TextStyles.textStyle.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.activeBottomBarButton.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 55,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SvgPicture.asset(roundPerson),
              const SizedBox(height: 10),
              Text(
                'Account'.toUpperCase(),
                style: TextStyles.textStyle.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.w400,
                  color: AppColors.activeBottomBarButton.withOpacity(0.6),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
