import 'package:flutter/material.dart';

import 'outlet_widget.dart';

class OutletsList extends StatelessWidget {
  const OutletsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        OutletWidget(
          enabled: true,
          price: '3.00 \$',
          type: 'Type2 (AC)',
          power: '22 kWh',
        ),
        OutletWidget(
          enabled: false,
          price: '6.00 \$',
          type: 'CHAdeMO',
          power: '200 kWh',
        ),
        OutletWidget(
          enabled: false,
          price: '3.00 \$',
          type: 'Type2 (AC)',
          power: '22 kWh',
        )
      ],
    );
  }
}
