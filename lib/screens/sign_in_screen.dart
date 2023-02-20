import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../theme/themes.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 40),
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
        ],
      ),
    );
  }
}
