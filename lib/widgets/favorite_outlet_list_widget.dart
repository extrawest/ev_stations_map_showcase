import 'package:flutter/material.dart';

import 'widgets.dart';

class FavoriteOutletsList extends StatelessWidget {
  const FavoriteOutletsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        FavoriteOutletWidget(
          price: '3.00 \$',
          power: '22 kWh',
        ),
        FavoriteOutletWidget(
          price: '6.00 \$',
          power: '200 kWh',
        ),
        FavoriteOutletWidget(
          price: '3.00 \$',
          power: '22 kWh',
        )
      ],
    );
  }
}
