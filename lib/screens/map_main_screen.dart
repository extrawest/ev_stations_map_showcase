import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:volkhov_maps_app/common/common.dart';
import 'package:volkhov_maps_app/routes.dart';
import 'package:volkhov_maps_app/screens/screens.dart';

import '../logic/bloc/bloc.dart';
import '../theme/themes.dart';
import '../utils/utils.dart';
import '../widgets/widgets.dart';

class MapMainScreen extends StatefulWidget {
  const MapMainScreen({super.key});

  @override
  State<MapMainScreen> createState() => _MapMainScreenState();
}

class _MapMainScreenState extends State<MapMainScreen> {
  PageController myPage = PageController(initialPage: 0);

  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final favoritesBloc = context.read<FavoritesBloc>();

    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: myPage,
          children: const [
            StaticMainScreenWidget(),
            MapScreen(),
            FavoritesScreen(),
            WalletScreen(),
            AccountScreen(),
          ],
        ),
        bottomNavigationBar: Theme(
          data: ThemeData(
            primaryColor: Colors.transparent,
            splashColor: Colors.transparent,
          ),
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            notchMargin: 14,
            color: AppColors.whiteColor,
            child: Container(
              height: 70,
              alignment: Alignment.center,
              child: BottomTabBar(
                tabBarItem: getBottomTabBarEnumItem(),
                onTapMap: () {
                  setState(() {
                    currentTabIndex = 1;
                    myPage.jumpToPage(currentTabIndex);
                  });
                },
                onTapFavorites: () {
                  setState(() {
                    currentTabIndex = 2;
                    if (GoogleAuth.firebaseUser != null) {
                      favoritesBloc.add(FavoritesRead());
                    }
                    myPage.jumpToPage(currentTabIndex);
                  });
                },
                onTapWallet: () {
                  setState(() {
                    currentTabIndex = 3;
                    myPage.jumpToPage(currentTabIndex);
                  });
                },
                onTapAccount: () {
                  setState(() {
                    currentTabIndex = 4;
                    myPage.jumpToPage(currentTabIndex);
                  });
                },
              ),
            ),
          ),
        ),
        floatingActionButton: SizedBox(
          width: 68,
          height: 68,
          child: FittedBox(
            child: FloatingActionButton(
              backgroundColor: AppColors.whiteColor,
              onPressed: () => setState(() {
                Navigator.pushNamed(context, chargingScreenRoute);
              }),
              child: SvgPicture.asset(greyFlash),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  BottomTabBarItem getBottomTabBarEnumItem() {
    BottomTabBarItem result;
    switch (currentTabIndex) {
      case 1:
        result = BottomTabBarItem.map;
        break;
      case 2:
        result = BottomTabBarItem.favorites;
        break;
      case 3:
        result = BottomTabBarItem.wallet;
        break;
      case 4:
        result = BottomTabBarItem.account;
        break;
      case 5:
        result = BottomTabBarItem.charging;
        break;
      default:
        result = BottomTabBarItem.none;
        break;
    }
    return result;
  }
}
