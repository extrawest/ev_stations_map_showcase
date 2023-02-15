import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:volkhov_maps_app/screens/map_sreen.dart';
import 'package:volkhov_maps_app/screens/wallet_screen.dart';

import '../theme/themes.dart';
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
    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: myPage,
          children: const [
            StaticMainScreenWidget(),
            MapScreen(),
            WalletScreen(),
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
                onTapMap: () {
                  myPage.jumpToPage(1);
                },
                onTapFavorites: () {
                  myPage.jumpToPage(0);
                },
                onTapWallet: () {
                  myPage.jumpToPage(2);
                },
                onTapAccount: () {
                  myPage.jumpToPage(0);
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
              onPressed: null,
              child: SvgPicture.asset(greyFlash),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }
}
