import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../logic/bloc/bloc.dart';
import '../models/models.dart';
import '../routes.dart';
import '../theme/themes.dart';
import 'widgets.dart';

class StationInfoBottomWidget extends StatefulWidget {
  final Place station;
  final Function()? addRemoveFavorite;
  final Function()? onClose;
  final void Function()? onJumpTap;

  const StationInfoBottomWidget({
    Key? key,
    required this.station,
    this.addRemoveFavorite,
    this.onClose,
    this.onJumpTap,
  }) : super(key: key);

  @override
  State<StationInfoBottomWidget> createState() =>
      _StationInfoBottomWidgetState();
}

class _StationInfoBottomWidgetState extends State<StationInfoBottomWidget> {
  @override
  void dispose() {
    if (widget.onClose != null) {
      widget.onClose!();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final chargestationsState = context.read<ChargestationsBloc>().state;
    final authState = context.watch<AuthBloc>().state;
    if (chargestationsState is ChargestationsLoaded) {
      final stationInfo = chargestationsState.stationslist
          .firstWhere((st) => st.stationId == widget.station.stationId);

      final favoritesBloc = context.watch<FavoritesBloc>();
      final favoriteState = favoritesBloc.state;
      List<String> favoriteIds = [];
      if (favoriteState is FavoritesLoaded) {
        favoriteIds = favoriteState.favoriteIds;
      }
      final isFavorite = isIdFavorite(favoriteIds, widget.station.stationId);
      final jumpBloc = context.read<JumpToMarkerBloc>();

      return Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 135,
                height: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColors.activeBottomBarButton,
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  SvgPicture.asset(greenBar),
                  const SizedBox(width: 6),
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        stationInfo.stationId,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                      Text('STATUS: ${firstLetterCapital(stationInfo.status)}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          )),
                    ],
                  )),
                  const SizedBox(width: 6),
                  GestureDetector(
                    onTap: () {
                      if (authState is AuthAutorized) {
                        favoritesBloc.add(FavoritesWrite(
                            stationId: widget.station.stationId));
                      } else {
                        Navigator.pushNamed(context, signInScreen);
                      }
                    },
                    child: SvgPicture.asset(
                        isFavorite ? yellowFilledStar : yellowStar),
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Coordinates',
                          style: TextStyles.textStyle.copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                          ),
                        ),
                        Text(
                          '${stationInfo.longitude}, ${stationInfo.latitude}',
                          style: TextStyles.textStyle.copyWith(
                            fontWeight: FontWeight.w300,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Text(
                    '15 m',
                    style: TextStyles.textStyle,
                  ),
                  const SizedBox(width: 11),
                  GestureDetector(
                      onTap: () {
                        if (widget.onJumpTap != null) {
                          widget.onJumpTap!();
                        }
                        jumpBloc.add(
                          JumpToMarkerWithCoordinates(
                            LatLng(
                              stationInfo.latitude ?? 0,
                              stationInfo.longitude ?? 0,
                            ),
                          ),
                        );
                      },
                      child: SvgPicture.asset(rightSign))
                ],
              ),
              const SizedBox(height: 25),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 149,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: AppColors.lightBlue),
                child: const Icon(
                  Icons.image,
                  size: 50,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Divider(
                  color: AppColors.dividerColor,
                  height: 1,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Text(
                  'Connectors',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              if (stationInfo.connectors != null)
                ...List.generate(
                  stationInfo.connectors!.length,
                  (int index) => StationInfoOutlet(
                    connector: stationInfo.connectors?[index],
                  ),
                ),
              //Last padding
              const SizedBox(height: 12)
            ],
          ));
    } else {
      return const Center(child: Text('Something went wrong'));
    }
  }
}

String firstLetterCapital(String? string) {
  String result = '';

  result = string != null ? string[0].toUpperCase() + string.substring(1) : '';
  return result;
}

bool isIdFavorite(List<String> favoriteIds, String stationId) {
  return favoriteIds.contains(stationId);
}
