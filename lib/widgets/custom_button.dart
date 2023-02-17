// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../theme/themes.dart';

class CustomButton extends StatelessWidget {
  final Function() onTap;
  final String caption;
  final String fontFamily;

  const CustomButton({
    Key? key,
    required this.onTap,
    required this.caption,
    this.fontFamily = 'Roboto',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.only(
          top: 30,
        ),
        padding: const EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: AppColors.activeBottomBarButton,
        ),
        child: Text(
          caption,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontFamily: fontFamily,
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: AppColors.whiteColor),
        ),
      ),
    );
  }
}
