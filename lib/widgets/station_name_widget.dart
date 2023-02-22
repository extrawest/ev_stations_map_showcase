import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/themes.dart';

class StationName extends StatelessWidget {
  const StationName({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(greenBar),
        const SizedBox(width: 6),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Station Name',
                style: TextStyles.textStyle.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                'STATUS: Available',
                style: TextStyles.textStyle.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ),
        SvgPicture.asset(yellowFilledStar)
      ],
    );
  }
}
