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
      body: BlocProvider(
        create: (context) => SearchStationBloc(),
        child: BlocListener<ChargestationsBloc, ChargestationsState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is ChargestationsLoaded) stations = state.stationslist;
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
                    SearchStationEvent.findItem(
                      searchString: input,
                      stations: stations,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
