import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:volkhov_maps_app/theme/assets.dart';

import '../services/services.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  late LatLng myPosition;

  late StreamSubscription<Position> positionStream;

  late Marker marker;

  BitmapDescriptor myMarkerIcon = BitmapDescriptor.defaultMarker;

  void setMyMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(100, 100)), myMarkerPng)
        .then(
      (icon) {
        setState(() {
          myMarkerIcon = icon;
        });
      },
    );
  }

  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> getPosition() async {
    final Position position = await determinePosition();
    myPosition = LatLng(position.latitude, position.longitude);
  }

  @override
  void initState() {
    getPosition();
    setMyMarkerIcon();

    myPosition = const LatLng(45.521563, -122.677433);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      positionStream =
          Geolocator.getPositionStream(locationSettings: locationSettings)
              .listen((Position position) {
        myPosition = LatLng(position.latitude, position.longitude);
        mapController.moveCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(
                position.latitude,
                position.longitude,
              ),
              zoom: 11.0,
            ),
          ),
        );
        setState(() {});
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
          markers: {
            Marker(
                markerId: const MarkerId('myPosition'),
                position: LatLng(myPosition.latitude, myPosition.longitude),
                draggable: true,
                onDragEnd: (value) {
                  // value is the new position
                },
                icon: myMarkerIcon // icon: markerIcon,
                ),
          },
        ),
      ),
    );
  }
}
