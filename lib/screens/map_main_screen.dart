import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:volkhov_maps_app/common/common.dart';
import 'package:volkhov_maps_app/routes.dart';
import 'package:volkhov_maps_app/screens/screens.dart';

import '../logic/bloc/bloc.dart';
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
    final favoritesBloc = context.read<FavoritesBloc>();
    final authState = context.watch<AuthBloc>().state;
    final routingBloc = context.read<RoutingBloc>();

    return MaterialApp(
      home: Scaffold(
        extendBody: true,
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: myPage,
          children: const [
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
          child: BlocListener<RoutingBloc, RoutingState>(
            listener: (context, state) {
              if (state is RoutingLoaded) {
                setState(() {
                  currentTabIndex = state.pageIndex;
                  if (currentTabIndex == 1 && authState is AuthAutorized) {
                    favoritesBloc.add(FavoritesRead());
                  }
                  myPage.jumpToPage(currentTabIndex);
                });
              }
            },
            child: BottomAppBar(
              shape: const CircularNotchedRectangle(),
              notchMargin: 14,
              color: AppColors.whiteColor,
              child: Container(
                height: 95,
                alignment: Alignment.center,
                child: BottomTabBar(
                  tabBarItem: getBottomTabBarEnumItem(),
                  onTapMap: () =>
                      routingBloc.add(const RoutingTransition(pageIndex: 0)),
                  onTapFavorites: () =>
                      routingBloc.add(const RoutingTransition(pageIndex: 1)),
                  onTapWallet: () =>
                      routingBloc.add(const RoutingTransition(pageIndex: 2)),
                  onTapAccount: () =>
                      routingBloc.add(const RoutingTransition(pageIndex: 3)),
                ),
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
              onPressed: () =>
                  Navigator.pushNamed(context, chargingScreenRoute),
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
        result = BottomTabBarItem.favorites;
        break;
      case 2:
        result = BottomTabBarItem.wallet;
        break;
      case 3:
        result = BottomTabBarItem.account;
        break;
      case 4:
        result = BottomTabBarItem.charging;
        break;
      default:
        result = BottomTabBarItem.map;
        break;
    }
    return result;
  }
}
