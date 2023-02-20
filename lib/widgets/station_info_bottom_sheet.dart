import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../logic/bloc/bloc.dart';
import '../models/models.dart';
import '../theme/themes.dart';
import 'widgets.dart';

class StationInfoBottomWidget extends StatelessWidget {
  final Place station;
  final Function()? addRemoveFavorite;

  const StationInfoBottomWidget({
    Key? key,
    required this.station,
    this.addRemoveFavorite,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: BlocBuilder<ChargestationsBloc, ChargestationsState>(
          builder: (context, state) {
        if (state is ChargestationsLoaded) {
          final stationInfo = state.stationslist
              .firstWhere((st) => st.stationId == station.stationId);

          return Column(
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
                        '${stationInfo.tenantId}',
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
                      onTap: addRemoveFavorite,
                      child: SvgPicture.asset(yellowStar)),
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
                          '${stationInfo.longitude}, ${stationInfo.latitude} here',
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
                  SvgPicture.asset(rightSign)
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
          );
        } else {
          return const Center(child: Text('Something went wrong'));
        }
      }),
    );
  }
}

String firstLetterCapital(String? string) {
  String result = '';

  result = string != null ? string[0].toUpperCase() + string.substring(1) : '';
  return result;
}
