// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../theme/themes.dart';

class FavoriteCoordinatesWidget extends StatelessWidget {
  final LatLng coordinate;

  const FavoriteCoordinatesWidget({
    Key? key,
    required this.coordinate,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 17),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Coordinates',
                  style: TextStyles.textStyle.copyWith(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                  ),
                ),
                Text(
                  '${coordinate.longitude}, ${coordinate.latitude}',
                  overflow: TextOverflow.ellipsis,
                  style: TextStyles.textStyle.copyWith(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          const Text(
            '15 m',
            style: TextStyles.textStyle,
          ),
          const SizedBox(width: 11),
          SvgPicture.asset(rightSign)
        ],
      ),
    );
  }
}
