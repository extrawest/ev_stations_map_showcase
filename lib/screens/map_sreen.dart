import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:volkhov_maps_app/logic/bloc/chargestations_bloc.dart';
import 'package:volkhov_maps_app/theme/assets.dart';

import '../models/models.dart';
import '../utils/utils.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  late ClusterManager _manager;

  final Completer<GoogleMapController> _controller = Completer();

  late LatLng myPosition;

  late StreamSubscription<Position> positionStream;

  late Marker marker;

  Set<Marker> markers = {};

  List<Place> placeItems = [];

  bool _mapCreated = false;

  double _currentZoom = 12.0;

  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _controller.complete(controller);
    _manager.setMapId(controller.mapId);

    setState(() {
      _mapCreated = true;
    });
  }

  Future<void> getPosition() async {
    final Position position = await determinePosition();
    myPosition = LatLng(
      position.latitude,
      position.longitude,
    );
  }

  @override
  void initState() {
    getPosition();

    setMarkersIcon(function: () => setState(() {}));

    _manager = _initClusterManager();

    myPosition = const LatLng(45.521563, -122.677433);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      positionStream = Geolocator.getPositionStream(
        locationSettings: locationSettings,
      ).listen((Position position) {
        myPosition = LatLng(
          position.latitude,
          position.longitude,
        );

        if (_mapCreated) {
          moveCameraTo(myPosition);
          setState(() {});
        }
      });
    });

    super.initState();
  }

  Future<void> moveCameraTo(LatLng position) {
    return mapController.moveCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            position.latitude,
            position.longitude,
          ),
          zoom: _currentZoom,
        ),
      ),
    );
  }

  @override
  void dispose() {
    mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          backgroundColor: Colors.green[700],
        ),
        body: Stack(children: [
          BlocConsumer<ChargestationsBloc, ChargestationsState>(
            builder: (context, state) {
              return GoogleMap(
                mapType: MapType.normal,
                onMapCreated: (GoogleMapController controller) {
                  _onMapCreated(controller);
                  if (state is ChargestationsLoaded) {
                    placeItems.addAll(setPlaceItems(state));
                    moveCameraTo(myPosition);
                  }
                },
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    myPosition.latitude,
                    myPosition.longitude,
                  ),
                  zoom: 11.0,
                ),
                markers: {
                  Marker(
                      markerId: const MarkerId('myPosition'),
                      position: LatLng(
                        myPosition.latitude,
                        myPosition.longitude,
                      ),
                      draggable: true,
                      onDragEnd: (value) {},
                      onTap: null,
                      icon: myMarkerIcon),
                  ...markers,
                },
                onCameraMove: _onCameraMove,
                onCameraIdle: _manager.updateMap,
              );
            },
            listener: (context, state) {},
          ),
        ]),
      ),
    );
  }

  void _onCameraMove(CameraPosition cameraPosition) {
    _manager.onCameraMove(cameraPosition);
    _currentZoom = cameraPosition.zoom + 2;
  }

  ClusterManager _initClusterManager() {
    return ClusterManager<Place>(
      placeItems,
      _updateMarkers,
      markerBuilder: _markerBuilder,
    );
  }

  void _updateMarkers(Set<Marker> markerSet) {
    log.fine('Updated ${markers.length} markers');
    setState(() {
      markers = markerSet;
    });
  }

  Future<Marker> Function(Cluster<Place>) get _markerBuilder =>
      (cluster) async {
        return Marker(
          markerId: MarkerId(cluster.getId()),
          position: cluster.location,
          onTap: () {
            log.fine('---- $cluster');
            moveCameraTo(cluster.location);
          },
          icon: cluster.isMultiple
              ? await getCountMarkerBitmap(
                  125,
                  text: cluster.count.toString(),
                )
              : getIcon(cluster.items.first.status),
        );
      };
}
