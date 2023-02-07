import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../theme/themes.dart';

class BackGround extends StatelessWidget {
  const BackGround({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        mapMainImage,
        fit: BoxFit.cover,
        width: width,
        height: height,
      ),
    );
  }
}
