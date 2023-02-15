// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../routes.dart';
import '../theme/themes.dart';

class BottomTabBar extends StatelessWidget {
  final Function() onTapMap;
  final Function() onTapFavorites;
  final Function() onTapWallet;
  final Function() onTapAccount;
  const BottomTabBar({
    Key? key,
    required this.onTapMap,
    required this.onTapFavorites,
    required this.onTapWallet,
    required this.onTapAccount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: onTapMap,
          child: SizedBox(
            width: 55,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  earth,
                  color: AppColors.activeBottomBarButton.withOpacity(0.6),
                ),
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
        ),
        GestureDetector(
          onTap: onTapFavorites,
          child: SizedBox(
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
        ),
        const SizedBox(
          width: 30,
        ),
        GestureDetector(
          onTap: onTapWallet,
          child: SizedBox(
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
        ),
        GestureDetector(
          onTap: onTapAccount,
          child: SizedBox(
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
        ),
      ],
    );
  }
}
