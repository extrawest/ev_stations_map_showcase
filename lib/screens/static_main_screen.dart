import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:volkhov_maps_app/widgets/widgets.dart';

import '../theme/themes.dart';
import '../utils/utils.dart';
import 'screens.dart';

class StaticMainScreenWidget extends StatelessWidget {
  const StaticMainScreenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        BackGround(width: width, height: height),
        const MapBodyWidget(),
        const Positioned(
          top: 126,
          right: 66,
          child: RoundFlash(
            color: AppColors.yellowColor,
          ),
        ),
        const Positioned(
          top: 202,
          right: 71,
          child: RoundFlash(
            color: AppColors.blackColor,
          ),
        ),
        const Positioned(
          top: 225,
          right: 225,
          child: RoundFlash(
            color: AppColors.redColor,
          ),
        ),
        const Positioned(
          bottom: 405,
          right: 168,
          child: RoundFlash(
            color: AppColors.greenColor,
          ),
        ),
        Positioned(
          bottom: 368,
          left: 49,
          child: Image.asset(placeVectorPng),
        ),
      ],
    );
  }
}

class MapBodyWidget extends StatelessWidget {
  const MapBodyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 43,
          ),
          child: CustomTextField(
            ontap: null,
            readOnly: true,
            hint: 'Type here',
            prefixIcon: SvgPicture.asset(searchIcon),
            suffixIcon: SvgPicture.asset(cancelIcon),
          ),
        ),
        const Expanded(
          child: SizedBox(),
        ),
        const SquareButton(
          asset: searchLocPng,
        ),
        const SquareButton(
          asset: threeBarIconPng,
        ),
        Container(
          margin: const EdgeInsets.only(
            top: 8,
            bottom: 34,
            right: 16,
            left: 16,
          ),
          padding: const EdgeInsets.all(16),
          width: screenWidth,
          // height: 20,
          decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(16)),
          child: Column(
            children: const [
              StationName(),
              CoordinatesWidget(),
              Divider(),
              OutletsList(),
            ],
          ),
        ),
        const SizedBox(height: 93),
      ],
    );
  }
}
