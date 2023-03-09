import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/bloc/bloc.dart';
import '../models/models.dart';
import '../theme/themes.dart';
import '../widgets/widgets.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final focus = FocusNode();
  final TextEditingController _textController = TextEditingController();
  List<ChargestationsModel> stations = [];

  @override
  void initState() {
    focus.requestFocus();

    super.initState();
  }

  @override
  void dispose() {
    focus.dispose();
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchBloc = context.read<SearchStationBloc>();
    final stationBlocState = context.read<ChargestationsBloc>().state;
    if (stationBlocState is ChargestationsLoaded) {
      stations = stationBlocState.stationslist;
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        foregroundColor: AppColors.blackColor,
        shadowColor: Colors.transparent,
      ),
      body: BlocBuilder<SearchStationBloc, SearchStationState>(
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: CustomTextField(
                  textEditingController: _textController,
                  focusNode: focus,
                  onCancelTap: () => setState(() {
                    _textController.clear();
                    searchBloc.add(const SearchStationClearSearch());
                  }),
                  onChanged: (input) {
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
                                onTap: () async {
                                  Navigator.of(context).pop();
                                },
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
          );
        },
      ),
      // ),
    );
  }
}
