import 'dart:async';
import 'dart:ui';

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

  late Set<Marker> markers;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  late LatLng myPosition;

  late StreamSubscription<Position> positionStream;

  late Marker marker;

  List<Place> placeItems = [];

  BitmapDescriptor myMarkerIcon = BitmapDescriptor.defaultMarker;

  BitmapDescriptor redMarkerIcon = BitmapDescriptor.defaultMarker;

  BitmapDescriptor greenMarkerIcon = BitmapDescriptor.defaultMarker;

  BitmapDescriptor yellowMarkerIcon = BitmapDescriptor.defaultMarker;

  BitmapDescriptor blackMarkerIcon = BitmapDescriptor.defaultMarker;

  bool _mapCreated = false;

  void setMarkersIcon() {
    setState(() {
      BitmapDescriptor.fromAssetImage(
              const ImageConfiguration(size: Size(30, 30)), oneMarker)
          .then(
        (icon) {
          myMarkerIcon = icon;
        },
      );
      BitmapDescriptor.fromAssetImage(
              const ImageConfiguration(size: Size(100, 100)), redMarkerPng)
          .then(
        (icon) {
          redMarkerIcon = icon;
        },
      );
      BitmapDescriptor.fromAssetImage(
              const ImageConfiguration(size: Size(100, 100)), greenMarkerPng)
          .then(
        (icon) {
          greenMarkerIcon = icon;
        },
      );
      BitmapDescriptor.fromAssetImage(
              const ImageConfiguration(size: Size(100, 100)), yellowMarkerPng)
          .then(
        (icon) {
          yellowMarkerIcon = icon;
        },
      );
      BitmapDescriptor.fromAssetImage(
              const ImageConfiguration(size: Size(100, 100)), blackMarkerPng)
          .then(
        (icon) {
          blackMarkerIcon = icon;
        },
      );
    });
  }

  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    setState(() {
      _mapCreated = true;
      // _manager.setMapId(controller.mapId);
    });
  }

  Future<void> getPosition() async {
    final Position position = await determinePosition();
    myPosition = LatLng(position.latitude, position.longitude);
  }

  @override
  void initState() {
    markers = {};
    getPosition();
    setMarkersIcon();

    _manager = _initClusterManager();

    myPosition = const LatLng(45.521563, -122.677433);

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      positionStream =
          Geolocator.getPositionStream(locationSettings: locationSettings)
              .listen((Position position) {
        myPosition = LatLng(position.latitude, position.longitude);

        if (_mapCreated) {
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
        }
      });
    });

    super.initState();
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
                  // _controller.complete(controller);
                  _onMapCreated(controller);
                  _manager.setMapId(controller.mapId);
                  if (state is ChargestationsLoaded) {
                    setMarkers(state);
                    // updateClusterManager();
                  }
                },
                // _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 11.0,
                ),
                markers: {
                  Marker(
                      markerId: const MarkerId('myPosition'),
                      position:
                          LatLng(myPosition.latitude, myPosition.longitude),
                      draggable: true,
                      onDragEnd: (value) {
                        // value is the new position
                      },
                      icon: myMarkerIcon // icon: markerIcon,
                      ),
                  ...markers,
                },
                onCameraMove: _manager.onCameraMove,
                onCameraIdle: _manager.updateMap,
              );
            },
            listener: (context, state) {
              // if (state is ChargestationsLoaded) {
              //   setMarkers(state);
              // }
            },
          ),
          // if (!_mapCreated) const Center(child: CircularProgressIndicator()),
        ]),
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //     _manager.setItems(<Place>[
        //       for (int i = 0; i < 30; i++)
        //         Place(
        //           stationId: 'New Place ${DateTime.now()} $i',
        //           status: Status.BUSY,
        //           latLng: LatLng(48.858265 + i * 0.01, 2.350107),
        //         ),
        //     ]);
        //   },
        //   child: Icon(Icons.update),
        // ),
      ),
    );
  }

  void setMarkers(ChargestationsLoaded state) {
    placeItems.clear();

    for (final stationslist in state.stationslist) {
      final place = Place(
        stationId: stationslist.stationId ?? '',
        latLng: LatLng(
          stationslist.latitude ?? 0,
          stationslist.longitude ?? 0,
        ),
        status: getStatus(stationslist.status ?? ''),
      );
      placeItems.add(place);
    }

    log.fine('${placeItems.map((e) => e.stationId)}');
  }

  void updateClusterManager() {
    _manager = ClusterManager<Place>(placeItems, _updateMarkers,
        markerBuilder: _markerBuilder);
  }

  ClusterManager _initClusterManager() {
    return ClusterManager<Place>(placeItems, _updateMarkers,
        markerBuilder: _markerBuilder);
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
            for (final p in cluster.items) {
              log.fine(p);
            }
          },
          icon: await _getMarkerBitmap(cluster.isMultiple ? 125 : 75,
              text: cluster.isMultiple ? cluster.count.toString() : null),
        );
      };

  Future<BitmapDescriptor> _getMarkerBitmap(int size, {String? text}) async {
    if (kIsWeb) size = (size / 2).floor();

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
}
