import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'models.dart';

class Place with ClusterItem {
  final String stationId;
  final LatLng latLng;
  final Status status;

  Place({
    required this.stationId,
    required this.latLng,
    required this.status,
  });

  @override
  String toString() {
    return 'Place $stationId (status : $status)';
  }

  @override
  LatLng get location => latLng;
}

// stationId;
//   String? tenantId;
//   String? chargePointId;
//   double? longitude;
//   double? latitude;
//   String? status;
