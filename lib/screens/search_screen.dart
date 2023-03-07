// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../logic/bloc/bloc.dart';
import '../models/models.dart';
import '../theme/themes.dart';
import '../widgets/widgets.dart';

class SearchScreen extends StatefulWidget {
  // final Function(LatLng)? moveCameraTo;

  const SearchScreen({
    // this.moveCameraTo,
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
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      final chargeDtationBloc = context.read<ChargestationsBloc>();
      chargeDtationBloc.add(ChargestationsStarted());
    });

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

    return Scaffold(
      appBar: AppBar(
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
        child: BlocBuilder<SearchStationBloc, SearchStationState>(
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
                                itemBuilder: (context, index) =>
                                    SearchResultItem(
                                  onTap: () async {
                                    Navigator.of(context).pop();
                                    // if (widget.moveCameraTo != null) {
                                    //   widget.moveCameraTo!(position);
                                    // }
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
      ),
    );
  }
}
