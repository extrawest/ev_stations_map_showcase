import 'dart:io';
import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../common/common.dart';
import '../models/models.dart';
import '../theme/assets.dart';

BitmapDescriptor myMarkerIcon = BitmapDescriptor.defaultMarker;

BitmapDescriptor redMarkerIcon = BitmapDescriptor.defaultMarker;

BitmapDescriptor greenMarkerIcon = BitmapDescriptor.defaultMarker;

BitmapDescriptor yellowMarkerIcon = BitmapDescriptor.defaultMarker;

BitmapDescriptor blackMarkerIcon = BitmapDescriptor.defaultMarker;

/// Determine the current position of the device.
///
/// When the location services are not enabled or permissions
/// are denied the `Future` will return an error.
Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue
    // accessing the position and request users of the
    // App to enable the location services.
    return Future.error('Location services are disabled.');
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied, next time you could try
      // requesting permissions again (this is also where
      // Android's shouldShowRequestPermissionRationale
      // returned true. According to Android guidelines
      // your App should show an explanatory UI now.
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately.
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  return await Geolocator.getCurrentPosition();
}

BitmapDescriptor getIcon(Status? status) {
  BitmapDescriptor result;
  switch (status) {
    case Status.available:
      result = greenMarkerIcon;
      break;
    case Status.offline:
      result = redMarkerIcon;
      break;
    case Status.busy:
      result = yellowMarkerIcon;
      break;
    default:
      result = blackMarkerIcon;
      break;
  }
  return result;
}

Future<BitmapDescriptor> getCountMarkerBitmap(int size, {String? text}) async {
  if (kIsWeb) {
    size = (size / 2).floor();
  }

  final PictureRecorder pictureRecorder = PictureRecorder();
  final Canvas canvas = Canvas(pictureRecorder);
  final Paint paint1 = Paint()..color = Colors.orange;
  final Paint paint2 = Paint()..color = Colors.white;

  canvas.drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1);
  canvas.drawCircle(Offset(size / 2, size / 2), size / 2.2, paint2);
  canvas.drawCircle(Offset(size / 2, size / 2), size / 2.8, paint1);

  if (text != null) {
    final TextPainter painter = TextPainter(textDirection: TextDirection.ltr);
    painter.text = TextSpan(
      text: text,
      style: TextStyle(
          fontSize: size / 3,
          color: Colors.white,
          fontWeight: FontWeight.normal),
    );
    painter.layout();
    painter.paint(
      canvas,
      Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
    );
  }

  final img = await pictureRecorder.endRecording().toImage(size, size);
  final data = await img.toByteData(format: ImageByteFormat.png) as ByteData;

  return BitmapDescriptor.fromBytes(data.buffer.asUint8List());
}

void setMarkersIcon({required Function() onFinish}) {
  BitmapDescriptor.fromAssetImage(
    const ImageConfiguration(size: Size(30, 30)),
    kIsWeb || Platform.isAndroid ? myMarkerPng : oneMarker,
  ).then(
    (icon) {
      myMarkerIcon = icon;
    },
  );
  BitmapDescriptor.fromAssetImage(
    const ImageConfiguration(size: Size(100, 100)),
    kIsWeb || Platform.isAndroid ? redMarkerPng3x : redMarkerPng,
  ).then(
    (icon) {
      redMarkerIcon = icon;
    },
  );
  BitmapDescriptor.fromAssetImage(
    const ImageConfiguration(size: Size(100, 100)),
    kIsWeb || Platform.isAndroid ? greenMarkerPng3x : greenMarkerPng,
  ).then(
    (icon) {
      greenMarkerIcon = icon;
    },
  );
  BitmapDescriptor.fromAssetImage(
    const ImageConfiguration(size: Size(100, 100)),
    kIsWeb || Platform.isAndroid ? yellowMarkerPng3x : yellowMarkerPng,
  ).then(
    (icon) {
      yellowMarkerIcon = icon;
    },
  );
  BitmapDescriptor.fromAssetImage(
    const ImageConfiguration(size: Size(100, 100)),
    kIsWeb || Platform.isAndroid ? blackMarkerPng3x : blackMarkerPng,
  ).then(
    (icon) {
      blackMarkerIcon = icon;
    },
  );
  onFinish();
}

List<Place> setPlaceItems(List<ChargestationsModel> stationslist) {
  final List<Place> items = [];

  for (final station in stationslist) {
    final status = getStatus(station.status);
    final place = Place(
      stationId: station.stationId,
      latLng: LatLng(
        station.latitude ?? 0,
        station.longitude ?? 0,
      ),
      status: status,
    );

    items.add(place);
  }
  return items;
}
