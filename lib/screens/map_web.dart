import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../models/models.dart';
import '../utils/utils.dart';

class WebMap extends StatefulWidget {
  const WebMap({super.key});

  @override
  State<WebMap> createState() => _WebMapState();
}

class _WebMapState extends State<WebMap> {
  late GoogleMapController mapController;

  late ClusterManager _manager;

  final Completer<GoogleMapController> _controller = Completer();

  late LatLng myPosition;

  // ignore: cancel_subscriptions
  late StreamSubscription<Position> positionStream;

  late Marker marker;

  Set<Marker> markers = {};

  List<Place> placeItems = [];

  bool _mapCreated = false;

  // double _currentZoom = 12.0;

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

  // Future<void> getLastPosition() async {
  //   final Position? position = await Geolocator.getLastKnownPosition();
  //   if (position != null) {
  //     myPosition = LatLng(
  //       position.latitude,
  //       position.longitude,
  //     );
  //   }
  // }

  // Future<void> getPosition() async {
  //   final Position position = await Geolocator.getCurrentPosition(
  //       desiredAccuracy: LocationAccuracy.high);
  //   myPosition = LatLng(
  //     position.latitude,
  //     position.longitude,
  //   );
  // }

  @override
  void initState() {
    _currentMapType = MapType.normal;
    // getPosition();

    setMarkersIcon(onFinish: () => setState(() {}));

    _manager = _initClusterManager();

    myPosition = const LatLng(45.521563, -122.677433);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      // await requestPermission(() {
      //   showPermissionDialog(context);
      // });

      positionStream = Geolocator.getPositionStream(
        locationSettings: locationSettings,
      ).listen((Position position) {
        myPosition = LatLng(
          position.latitude,
          position.longitude,
        );

        if (_mapCreated) {
          // moveCameraTo(position: myPosition);
          setState(() {});
        }
      });
    });

    super.initState();
  }
  // final LatLng _center = const LatLng(45.521563, -122.677433);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.green[700],
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Maps Sample App'),
          elevation: 2,
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: LatLng(
              myPosition.latitude,
              myPosition.longitude,
            ),
            zoom: 11.0,
          ),
        ),
      ),
    );
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
                  // moveCameraTo(position: cluster.location);
                }
              : () {
                  final station = cluster.items.first;
                  // showStationInfoBottomSheet(
                  //     context: context, station: station);
                },
          icon: cluster.isMultiple
              ? await getCountMarkerBitmap(
                  125,
                  text: cluster.count.toString(),
                )
              : getIcon(cluster.items.first.status),
        );
      };

  // Future<void> moveCameraTo({required LatLng position, double? zoom}) {
  //   return mapController.animateCamera(
  //     CameraUpdate.newCameraPosition(
  //       CameraPosition(
  //         target: LatLng(
  //           position.latitude,
  //           position.longitude,
  //         ),
  //         zoom: zoom ?? _currentZoom,
  //       ),
  //     ),
  //   );
  // }

  // void showStationInfoBottomSheet({
  //   required BuildContext context,
  //   required Place station,
  //   Function()? addRemoveFavorite,
  // }) {
  //   showModalBottomSheet(
  //       isScrollControlled: true,
  //       useRootNavigator: true,
  //       shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.circular(10.0),
  //       ),
  //       context: context,
  //       builder: (builder) {
  //         return StationInfoBottomWidget(
  //           station: station,
  //           addRemoveFavorite: addRemoveFavorite,
  //         );
  //       });
  // }

  // void _onCameraMove(CameraPosition cameraPosition) {
  //   _manager.onCameraMove(cameraPosition);
  //   _currentZoom = cameraPosition.zoom + 2;
  // }
}
