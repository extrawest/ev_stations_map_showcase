import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:volkhov_maps_app/widgets/widgets.dart';

import '../logic/bloc/bloc.dart';
import '../models/models.dart';
import '../theme/themes.dart';
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

  MapType _currentMapType = MapType.normal;

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

  Future<void> getLastPosition() async {
    final Position? position = await Geolocator.getLastKnownPosition();
    if (position != null) {
      myPosition = LatLng(
        position.latitude,
        position.longitude,
      );
    }
  }

  Future<void> getPosition() async {
    // final Position position = await determinePosition();
    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    myPosition = LatLng(
      position.latitude,
      position.longitude,
    );
  }

  // enums.SelectedMapType getSelectedMapType() {
  //   return _currentMapType == MapType.satellite
  //       ? enums.SelectedMapType.satelliteType
  //       : enums.SelectedMapType.defaultType;
  // }

  @override
  void initState() {
    _currentMapType = MapType.normal;
    getPosition();

    setMarkersIcon(function: () => setState(() {}));

    _manager = _initClusterManager();

    myPosition = const LatLng(45.521563, -122.677433);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await requestPermission(() {
        showPermissionDialog(context);
      });

      positionStream = Geolocator.getPositionStream(
        locationSettings: locationSettings,
      ).listen((Position position) {
        myPosition = LatLng(
          position.latitude,
          position.longitude,
        );

        if (_mapCreated) {
          moveCameraTo(position: myPosition);
          setState(() {});
        }
      });
    });

    super.initState();
  }

  Future<void> moveCameraTo({required LatLng position, double? zoom}) {
    return mapController.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(
            position.latitude,
            position.longitude,
          ),
          zoom: zoom ?? _currentZoom,
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
          BlocBuilder<ChargestationsBloc, ChargestationsState>(
            builder: (context, state) {
              if (state is ChargestationsLoading) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is ChargestationsLoaded) {
                return GoogleMap(
                  mapType: _currentMapType,
                  onMapCreated: (GoogleMapController controller) {
                    _onMapCreated(controller);
                    placeItems.addAll(setPlaceItems(state));
                    moveCameraTo(position: myPosition);
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
                  myLocationButtonEnabled: false,
                  onCameraMove: _onCameraMove,
                  onCameraIdle: _manager.updateMap,
                );
              } else {
                return const Center(
                  child: Text('Error ChargestationsBloc'),
                );
              }
            },
          ),
        ]),
        floatingActionButton: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MapButton(
              image: searchLocPng,
              function: () => requestPermission(
                () {
                  showPermissionDialog(context);
                },
              ),
            ),
            const SizedBox(height: 20),
            MapButton(
              image: threeBarIconPng,
              function: () => showMapTypeBottomSheet(
                  context: context, mapType: _currentMapType),
            ),
            const SizedBox(height: 105),
          ],
        ),
      ),
    );
  }

  Future<void> showMapTypeBottomSheet({
    required BuildContext context,
    required MapType mapType,
  }) async {
    final res = await showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        context: context,
        builder: (builder) {
          return BodyBottomSheetWidget(
            mapType: mapType,
          );
        });
    setState(() {
      _currentMapType = res;
    });
  }

  Future<dynamic> showPermissionDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Attention'),
            content: const Text(
                'Turning on the geolocation is necessary to determine your location'),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    openAppSettings();
                    Navigator.of(context).pop();
                  },
                  child: const Text('Accept')),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text('Decline')),
            ],
          );
        });
  }

  Future<void> requestPermission(Function() callBack) async {
    if (await Permission.location.request().isGranted) {
      await getLastPosition();
      await moveCameraTo(position: myPosition, zoom: 15);
    } else {
      final permissionStatus = await Permission.locationWhenInUse.request();
      if (permissionStatus == PermissionStatus.permanentlyDenied ||
          permissionStatus == PermissionStatus.denied) {
        callBack();
      }
    }
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
          onTap: cluster.isMultiple
              ? () {
                  log.fine('---- $cluster');
                  moveCameraTo(position: cluster.location);
                }
              : () {
                  final station = cluster.items.first;
                  showStationInfoBottomSheet(
                      context: context, station: station);
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

void showStationInfoBottomSheet({
  required BuildContext context,
  required Place station,
}) {
  showModalBottomSheet(
      isScrollControlled: true,
      useRootNavigator: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: context,
      builder: (builder) {
        return StationInfoWidget(station: station);
      });
}

class MapButton extends StatelessWidget {
  final String image;
  final Function() function;
  const MapButton({super.key, required this.image, required this.function});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: 55,
      alignment: Alignment.topCenter,
      child: GestureDetector(
        onTap: function,
        child: Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(28),
              color: AppColors.whiteColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Image.asset(image)),
      ),
    );
  }
}
