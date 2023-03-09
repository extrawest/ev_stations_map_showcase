import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/models.dart';
import '../theme/themes.dart';
import 'widgets.dart';

class FavoriteItemWidget extends StatelessWidget {
  final ChargestationsModel item;

  const FavoriteItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final coordinate = LatLng(item.latitude ?? 0, item.longitude ?? 0);

    return Container(
      margin: const EdgeInsets.only(
        top: 8,
        right: 16,
        left: 16,
      ),
      padding: const EdgeInsets.all(16),
      width: screenWidth,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowColor.withOpacity(0.15),
            blurRadius: 15,
            spreadRadius: 0,
            offset: const Offset(2, 6),
          ),
          BoxShadow(
            color: AppColors.shadowColor.withOpacity(0.15),
            blurRadius: 15,
            spreadRadius: 0,
            offset: const Offset(-2, -2),
          ),
        ],
      ),
      child: Column(
        children: [
          FavoriteStationName(
              name: item.stationId, id: item.chargePointId ?? ''),
          FavoriteCoordinatesWidget(coordinate: coordinate),
          const FavoriteOutletsList(),
        ],
      ),
    );
  }
}
