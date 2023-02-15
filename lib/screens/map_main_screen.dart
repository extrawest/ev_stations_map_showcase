import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:volkhov_maps_app/screens/map_sreen.dart';
import 'package:volkhov_maps_app/theme/assets.dart';

import '../theme/themes.dart';
import '../widgets/widgets.dart';

class MapMainScreen extends StatefulWidget {
  const MapMainScreen({super.key});

  @override
  State<MapMainScreen> createState() => _MapMainScreenState();
}

class _MapMainScreenState extends State<MapMainScreen> {
  PageController myPage = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: PageView(
          controller: myPage,
          children: const [
            StaticMainScreenWidget(),
            MapScreen(),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          notchMargin: 14,
          color: AppColors.whiteColor,
          child: Container(
            height: 90,
            alignment: Alignment.center,
            child: BottomTabBar(
              onTapMap: () {
                myPage.jumpToPage(1);
              },
              onTapAccount: () {
                myPage.jumpToPage(2);
              },
              onTapFavorites: () {
                myPage.jumpToPage(3);
              },
              onTapWallet: () {
                myPage.jumpToPage(4);
              },
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
