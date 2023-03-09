import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../logic/bloc/bloc.dart';
import '../models/models.dart';
import '../screens/screens.dart';
import '../theme/themes.dart';
import '../utils/utils.dart';

class SearchResultItem extends StatelessWidget {
  final ChargestationsModel station;
  final void Function() onTap;
  const SearchResultItem({
    Key? key,
    required this.station,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final jumpBloc = context.read<JumpToMarkerBloc>();

    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (context, state) {
        return GestureDetector(
          child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          station.stationId,
                          style: TextStyles.textWalletStyle,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '${station.longitude}, ${station.latitude}',
                          style: TextStyles.smallTextStyle.copyWith(
                            color: AppColors.greyTextColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8),
                  Row(
                    children: [
                      Text(
                        '15 m',
                        style: TextStyles.smallTextStyle.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(width: 4),
                      GestureDetector(
                        onTap: () {
                          onTap();
                          jumpBloc.add(JumpToMarkerWithCoordinates(
                            LatLng(
                              station.latitude ?? 0,
                              station.longitude ?? 0,
                            ),
                          ));
                        },
                        child: Container(
                            padding: const EdgeInsets.all(5),
                            child: SvgPicture.asset(rightSign)),
                      ),
                    ],
                  ),
                ],
              )),
        );
      },
    );
  }

  void showStationInfo({
    required BuildContext context,
    required Function() onFavoriteTap,
  }) {
    final status = getStatus(station.status);
    final stationPlace = Place(
      stationId: station.stationId,
      icon: getIcon(status),
      status: status,
      latLng: LatLng(
        station.latitude ?? 0,
        station.longitude ?? 0,
      ),
    );
    showStationInfoBottomSheet(
      context: context,
      station: stationPlace,
      addRemoveFavorite: onFavoriteTap,
    );
  }
}
