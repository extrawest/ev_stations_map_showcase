import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';

class LoadingSpinner extends StatelessWidget {
  const LoadingSpinner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Center(
        child: CircularProgressIndicator(
          color: AppColors.blueColor,
        ),
      ),
    );
  }
}
