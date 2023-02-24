import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../logic/bloc/bloc.dart';
import '../models/models.dart';
import '../theme/themes.dart';
import '../widgets/widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final focus = FocusNode();

  @override
  void initState() {
    focus.requestFocus();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final chargeDtationBloc = context.read<ChargestationsBloc>();
      chargeDtationBloc.add(ChargestationsStarted());
    });

    super.initState();
  }

  @override
  void dispose() {
    focus.dispose();
    super.dispose();
  }

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
                focusNode: focus,
                suffixIcon: SvgPicture.asset(
                  cancelIcon,
                  color: AppColors.lightGrey,
                ),
                onChanged: (input) {
                  final searchBloc = context.read<SearchStationBloc>();
                  searchBloc.add(SearchStationFindItem(
                    searchString: input,
                    stations: stations,
                  ));
                },
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
                  return searchState.foundStations.isEmpty
                      ? const SearchNoResultWidget()
                      : Expanded(
                          child: ListView.builder(
                            itemCount: searchState.foundStations.length,
                            itemBuilder: (context, index) => SearchResultItem(
                              station: searchState.foundStations[index],
                            ),
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
