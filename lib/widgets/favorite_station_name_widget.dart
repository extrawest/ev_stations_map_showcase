import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/themes.dart';

class FavoriteStationName extends StatelessWidget {
  final String name;
  final String id;

  const FavoriteStationName({
    Key? key,
    required this.name,
    required this.id,
  }) : super(key: key);

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
                name,
                overflow: TextOverflow.ellipsis,
                style: TextStyles.textStyle.copyWith(
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                id,
                style: TextStyles.textStyle.copyWith(
                  fontWeight: FontWeight.w300,
                  fontSize: 12,
                ),
              )
            ],
          ),
        ),
        const SizedBox(width: 8),
        SvgPicture.asset(yellowFilledStar)
      ],
    );
  }
}
