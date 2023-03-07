import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../common/common.dart';
import '../logic/bloc/bloc.dart';
import '../theme/themes.dart';

class BottomTabBar extends StatelessWidget {
  final BottomTabBarItem tabBarItem;
  final Function() onTapMap;
  final Function() onTapFavorites;
  final Function() onTapWallet;
  final Function() onTapAccount;
  const BottomTabBar({
    Key? key,
    required this.tabBarItem,
    required this.onTapMap,
    required this.onTapFavorites,
    required this.onTapWallet,
    required this.onTapAccount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox.shrink(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            BottomTabBarMenuItem(
                onTapMap: onTapMap,
                active: tabBarItem == BottomTabBarItem.map,
                image: earth,
                name: 'MAP'),
            BottomTabBarMenuItem(
              onTapMap: onTapFavorites,
              active: tabBarItem == BottomTabBarItem.favorites,
              image: greyStar,
              name: 'FavoriteS'.toUpperCase(),
            ),
            const SizedBox(
              width: 30,
            ),
            BlocBuilder<WalletBloc, WalletState>(builder: (context, state) {
              double balance = 0;
              if (state is WalletLoaded) {
                balance = state.walletData.balance;
              }
              return BottomTabBarMenuItem(
                onTapMap: onTapWallet,
                active: tabBarItem == BottomTabBarItem.wallet,
                image: wallet,
                name: '\$$balance'.toUpperCase(),
              );
            }),
            BottomTabBarMenuItem(
              onTapMap: onTapAccount,
              active: tabBarItem == BottomTabBarItem.account,
              image: roundPerson,
              name: 'Account'.toUpperCase(),
            ),
          ],
        ),
        SizedBox(
          height: 25,
          child: TextButton(
            // style: TextButtonTheme(),
            child: Text(
              'Made by Extrawest',
              style: TextStyles.smallTextStyle.copyWith(
                  color: AppColors.activeBottomBarButton,
                  fontWeight: FontWeight.w700,
                  height: 0.7),
            ),
            onPressed: () => _launchURL(),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
      ],
    );
  }
}

class BottomTabBarMenuItem extends StatelessWidget {
  final String name;
  final String image;
  final Function() onTapMap;
  final bool active;

  const BottomTabBarMenuItem({
    Key? key,
    required this.name,
    required this.image,
    required this.onTapMap,
    required this.active,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapMap,
      child: SizedBox(
        width: 55,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SvgPicture.asset(
              image,
              color: active
                  ? AppColors.activeBottomBarButton
                  : AppColors.activeBottomBarButton.withOpacity(0.6),
            ),
            const SizedBox(height: 10),
            Text(
              name,
              style: TextStyles.textStyle.copyWith(
                fontSize: 10,
                fontWeight: FontWeight.w400,
                color: active
                    ? AppColors.activeBottomBarButton
                    : AppColors.activeBottomBarButton.withOpacity(0.6),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> _launchURL() async {
  const url = 'https://www.extrawest.com/';
  final uri = Uri.parse(url);
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri,
        mode: kIsWeb
            ? LaunchMode.externalApplication
            : LaunchMode.platformDefault);
  } else {
    throw 'Could not launch $url';
  }
}
