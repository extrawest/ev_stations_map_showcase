import 'package:flutter/material.dart';

import '../theme/themes.dart';

class CostWidget extends StatelessWidget {
  const CostWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Cost:',
            style: TextStyles.textWalletStyle
                .copyWith(fontWeight: FontWeight.w600),
          ),
          Text(
            '\$ 34.24',
            style: TextStyles.textStyle.copyWith(fontWeight: FontWeight.w600),
          )
        ],
      ),
    );
  }
}
