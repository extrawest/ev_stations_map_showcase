import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../logic/bloc/bloc.dart';
import '../models/models.dart';
import '../theme/themes.dart';
import '../widgets/widgets.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<ChargestationsModel> stations = [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search station'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: AppColors.blackColor,
        shadowColor: Colors.transparent,
      ),
      body: BlocListener<ChargestationsBloc, ChargestationsState>(
        listener: (context, state) {
          if (state is ChargestationsLoaded) {
            stations = state.stationslist;
          }
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: CustomTextField(
                suffixIcon: SvgPicture.asset(
                  cancelIcon,
                  color: AppColors.lightGrey,
                ),
                onChanged: (input) => SearchStationBloc().add(
                  SearchStationFindItem(
                    searchString: input,
                    stations: stations,
                  ),
                ),
              ),
            ),
            BlocBuilder<SearchStationBloc, SearchStationState>(
              builder: (context, searchState) {
                if (searchState is SearchStationLoading) {
                  return const LoadingSpinner();
                } else if (searchState is SearchStationInitial) {
                  return const SizedBox();
                } else if (searchState is SearchStationError) {
                  return const Center(child: Text('error'));
                } else if (searchState is SearchStationFound) {
                  // return Text('stations -----> ${searchState.foundStations}');
                  return ListView.builder(
                    itemCount: searchState.foundStations.length,
                    itemBuilder: (context, index) => SearchResultItem(
                      stations: searchState.foundStations[index],
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
