import 'package:flutter/material.dart';

import '../models/models.dart';

class SearchResultItem extends StatelessWidget {
  final ChargestationsModel stations;
  const SearchResultItem({
    super.key,
    required this.stations,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Text(stations.stationId));
  }
}
