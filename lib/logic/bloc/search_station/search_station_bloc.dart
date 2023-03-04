import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/models.dart';

part 'search_station_event.dart';
part 'search_station_state.dart';

class SearchStationBloc extends Bloc<SearchStationEvent, SearchStationState> {
  SearchStationBloc() : super(SearchStationInitial()) {
    on<SearchStationFindItem>(_onFindItem);
    on<SearchStationClearSearch>(_onClearSearch);
  }

  Future<void> _onFindItem(
    SearchStationEvent event,
    Emitter<SearchStationState> emit,
  ) async {
    List<ChargestationsModel> result = [];
    emit(SearchStationLoading());
    try {
      final searchString = (event as SearchStationFindItem).searchString;
      result = [
        ...event.stations
            .where((element) => element.stationId.contains(searchString))
      ];
      emit(SearchStationFound(foundStations: result));
    } catch (e) {
      emit(SearchStationError(
        'Search chargestation error :${e.toString()}',
      ));
    }
  }

  Future<void> _onClearSearch(
    SearchStationEvent event,
    Emitter<SearchStationState> emit,
  ) async {
    try {
      emit(SearchStationInitial());
    } catch (e) {
      emit(SearchStationError(
        'Search chargestation error :${e.toString()}',
      ));
    }
  }
}
