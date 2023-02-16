import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/themes.dart';

class CoordinatesWidget extends StatelessWidget {
  const CoordinatesWidget({super.key});

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
                  'Longitude, latitude here',
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
