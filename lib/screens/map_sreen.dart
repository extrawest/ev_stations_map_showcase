import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:volkhov_maps_app/widgets/widgets.dart';

import '../logic/bloc/bloc.dart';
import '../models/models.dart';
import '../theme/themes.dart';
import '../utils/utils.dart';
import 'screens.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  bool isMapControllerInitialized = false;

  late ClusterManager _manager;

  final Completer<GoogleMapController> _controller = Completer();

  late LatLng myPosition;

  late Marker marker;

  Set<Marker> markers = {};

  List<Place> placeItems = [];

  double _currentZoom = 12.0;

  MapType _currentMapType = MapType.normal;

  bool isIgnorePointer = false;

  final LocationSettings locationSettings = const LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );

  @override
  void initState() {
    _currentMapType = MapType.normal;
    getPosition();

    setMarkersIcon(onFinish: () => setState(() {}));

    _manager = _initClusterManager();

    myPosition = const LatLng(51.974059, 5.340242465576188);

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
        body: Stack(
          children: [
            BlocConsumer<JumpToMarkerBloc, JumpToMarkerState>(
              listener: (context, jumpState) {
                if (jumpState is JumpToMarkerLoaded) {
                  setState(() {
                    myPosition = jumpState.position;
                    moveCameraTo(position: myPosition, zoom: 15);
                  });
                }
              },
              builder: (context, jumpState) {
                return BlocBuilder<ChargestationsBloc, ChargestationsState>(
                  builder: (context, state) {
                    if (state is ChargestationsLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is ChargestationsLoaded) {
                      return GoogleMap(
                        scrollGesturesEnabled: !isIgnorePointer,
                        zoomControlsEnabled: isIgnorePointer,
                        gestureRecognizers: {
                          Factory<OneSequenceGestureRecognizer>(
                              () => ScaleGestureRecognizer()),
                        },
                        mapType: _currentMapType,
                        onMapCreated: (GoogleMapController controller) async {
                          if (jumpState is! JumpToMarkerLoaded) {
                            await _onMapCreated(controller, myPosition);
                            placeItems
                                .addAll(setPlaceItems(state.stationslist));
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
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 43,
              ),
              child: CustomTextField(
                readOnly: true,
                ontap: () async => openScreenWithFade(
                    context,
                    const SearchScreen(
                        // moveCameraTo: (searchPosition) => moveCameraTo(
                        //   position: searchPosition,
                        //   zoom: 15,
                        // ),
                        )),
                hint: 'Type here',
                prefixIcon: SvgPicture.asset(searchIcon),
              ),
            ),
          ],
        ),
        floatingActionButton: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            MapButton(
                image: searchLocPng,
                onTap: () async {
                  if (!kIsWeb) {
                    requestPermission(
                      () {
                        showPermissionDialog(context);
                      },
                    );
                  } else {
                    await getPosition();
                    await moveCameraTo(position: myPosition, zoom: 15);
                  }
                }),
            const SizedBox(height: 20),
            MapButton(
                image: threeBarIconPng,
                onTap: () {
                  setState(() {
                    setIgnorePointer(true);
                  });
                  showMapTypeBottomSheet(
                    context: context,
                    mapType: _currentMapType,
                  );
                }),
            const SizedBox(height: 105),
          ],
        ),
      ),
    );
  }

  void setIgnorePointer(bool ignorePointer) {
    isIgnorePointer = ignorePointer;
    setState(() {});
  }

  Future<void> _onMapCreated(
      GoogleMapController controller, LatLng? position) async {
    if (isMapControllerInitialized == false) {
      mapController = controller;
      _controller.complete(controller);
      _manager.setMapId(controller.mapId);

      setState(() {
        isMapControllerInitialized = true;
      });
    }

    // if (!kIsWeb) {
    //   await requestPermission(() {
    //     showPermissionDialog(context);
    //   });
    // } else {
    if (kIsWeb) {
      if (position == null) {
        await getPosition();
      }
      await moveCameraTo(position: myPosition, zoom: 15);
    }
  }

  Future<void> getLastPosition() async {
    final Position? position = await Geolocator.getLastKnownPosition();
    if (position != null) {
      myPosition = LatLng(
        position.latitude,
        position.longitude,
      );
      setState(() {});
    }
  }

  Future<void> getPosition() async {
    final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    myPosition = LatLng(
      position.latitude,
      position.longitude,
    );
    setState(() {});
  }

  Future<void> moveCameraTo({required LatLng position, double? zoom}) async {
    return await mapController.animateCamera(
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
            onClose: () => WidgetsBinding.instance
                .addPostFrameCallback((_) => setIgnorePointer(false)),
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
                    if (!kIsWeb) {
                      openAppSettings();
                    }
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
                  moveCameraTo(position: cluster.location);
                }
              : () {
                  if (!isIgnorePointer) {
                    final station = cluster.items.first;
                    WidgetsBinding.instance
                        .addPostFrameCallback((_) => setIgnorePointer(true));
                    showStationInfoBottomSheet(
                        onClose: () => WidgetsBinding.instance
                            .addPostFrameCallback(
                                (_) => setIgnorePointer(false)),
                        context: context,
                        station: station);
                  }
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
  Function()? onClose,
  Function()? addRemoveFavorite,
}) {
  showModalBottomSheet(
      isScrollControlled: true,
      useRootNavigator: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      context: context,
      builder: (builder) {
        return StationInfoBottomWidget(
          onClose: onClose,
          station: station,
          addRemoveFavorite: addRemoveFavorite,
        );
      });
}
