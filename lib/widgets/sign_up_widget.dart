import 'package:flutter/material.dart';

import '../theme/themes.dart';

class SignUpWidget extends StatelessWidget {
  final Function() onTap;
  const SignUpWidget({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(27, 180, 27, 113),
          child: Center(
            child: Text(
              'Sign Up',
              style: TextStyles.headerTextStyle.copyWith(
                fontSize: 32,
              ),
            ),
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.greyTextColor,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(
                    20,
                    20,
                    20,
                    20,
                  ),
                  child: Image.asset(
                    googleSignPng,
                    width: 22,
                    height: 22,
                  ),
                ),
                Text(
                  'Sign Up with Google',
                  style: TextStyles.textStyle.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.greyTextColor,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(
                    20,
                    20,
                    20,
                    20,
                  ),
                  child: SizedBox(
                    width: 22,
                    height: 22,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
